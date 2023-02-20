class UsersContorller < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to cats_url(@user)
        else
            puts @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:password_digest, :username, :session_token)
    end
end