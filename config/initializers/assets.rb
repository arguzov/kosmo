# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += ['v3/common.css','v3/bootstrap/css/*.css','v3/controller/*.scss',
                                               'v3/layout/*','v3/plugins/magnific-popup/*.css','v3/plugins/owl/*.css','v3/plugins/toastr/*.css','v3/skins/*.css']
