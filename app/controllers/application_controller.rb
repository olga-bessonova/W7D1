class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token

    def login(user)
        session[:session_token] = user.reset_session_token!
    end
end