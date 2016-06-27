class Manager::UsersController < ApplicationController
    layout 'manager'

    def index
        @users = User.where('id > 3')
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                format.html { redirect_to :manager_users, notice: 'Создан!' }
            else
                format.html { render action: 'new' }
            end
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to :manager_users
        else
            render json: @product.errors
        end
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to :manager_users
    end

    def user_params
        params.require(:user).permit(:name, :phone, :email, :password)
    end
end
