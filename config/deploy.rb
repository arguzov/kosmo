# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'kosmo'
set :repo_url, 'git@github.com:axxilius/kosmo.git'
application = 'kosmo'
set :rvm_type, :user
#set :rvm_ruby_version, '2.0.0-p353'
set :deploy_to, '/var/www/apps/kosmo'
set :rails_env, 'production'

namespace :foreman do
    desc 'Start server'
    task :start do
        on roles(:all) do
            sudo "start #{application}"
        end
    end

    desc 'Stop server'
    task :stop do
        on roles(:all) do
            sudo "stop #{application}"
        end
    end

    desc 'Restart server'
    task :restart do
        on roles(:all) do
            sudo "restart #{application}"
        end
    end

    desc 'Server status'
    task :status do
        on roles(:all) do
            execute "initctl list | grep #{application}"
        end
    end
end

namespace :git do
    desc 'Deploy'
    task :deploy do
        ask(:message, "Commit message?")
        run_locally do
            execute "git add -A"
            execute "git commit -m '#{fetch(:message)}'"
            execute "git push"
        end
    end
end

namespace :deploy do

    desc 'Setup'
    task :setup do
        on roles(:all) do
            execute "mkdir -p  #{shared_path}/config/"
            execute "mkdir -p /var/www/apps/#{application}/run/"
            execute "mkdir -p /var/www/apps/#{application}/log/"
            execute "mkdir -p /var/www/apps/#{application}/socket/"
            execute "mkdir -p #{shared_path}/system"
            sudo "ln -sf /var/log/upstart /var/www/log/upstart"

            upload!('shared/database.yml', "#{shared_path}/config/database.yml")

            upload!('shared/Procfile', "#{shared_path}/Procfile")


            upload!('shared/nginx.conf', "#{shared_path}/nginx.conf")
            sudo 'stop nginx'
            sudo "rm -f /usr/local/nginx/conf/nginx.conf"
            sudo "ln -s #{shared_path}/nginx.conf /usr/local/nginx/conf/nginx.conf"
            sudo 'start nginx'

            within release_path do
                with rails_env: fetch(:rails_env) do
                    execute :rake, "db:create"
                end
            end

        end
    end

    desc 'Create symlink'
    task :symlink do
        on roles(:all) do
            execute "ln -sf #{shared_path}/config/database.yml #{release_path}/config/database.yml"
            execute "ln -s #{shared_path}/Procfile #{release_path}/Procfile"
            execute "ln -s #{shared_path}/system #{release_path}/public/system"
            execute "ln -sf #{shared_path}/public/system #{release_path}/public/system"
            execute "ln -sf #{shared_path}/public/data #{release_path}/public/data"
        end
    end

    desc 'Foreman init'
    task :foreman_init do
        on roles(:all) do
            foreman_temp = "/var/www/tmp/foreman"
            execute  "mkdir -p #{foreman_temp}"
            # Создаем папку current для того, чтобы foreman создавал upstart файлы с правильными путями
            execute "ln -s #{release_path} #{current_path}"

            within current_path do
                execute "cd #{current_path}"
                execute :bundle, "exec foreman export upstart #{foreman_temp} -a #{application} -u deployer -l /var/www/apps/#{application}/log -d #{current_path}"
            end
            sudo "mv #{foreman_temp}/* /etc/init/"
            sudo "rm -r #{foreman_temp}"
        end
    end


    desc 'Restart application'
    task :restart do
        on roles(:app), in: :sequence, wait: 5 do
            sudo "restart #{application}"
        end
    end

    after :finishing, 'deploy:cleanup'
    after :finishing, 'deploy:restart'

    after :updating, 'deploy:symlink'

    after :setup, 'deploy:foreman_init'

    after :foreman_init, 'foreman:start'

    before :foreman_init, 'rvm:hook'

    before :setup, 'deploy:starting'
    before :setup, 'deploy:updating'
    before :setup, 'bundler:install'
    before :deploy, 'git:deploy'
end
