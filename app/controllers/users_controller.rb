class UsersController < ApplicationController
    def current
        if current_user
            @user = current_user
        else
            redirect_to user_session_path
        end
    end
end
