class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    respond_to :html

    def lastfm
      @user = User.from_last_fm_auth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
      else
        redirect_to root_path
      end
    end

    def passthru
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
end
