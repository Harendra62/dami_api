class UsersController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.valid?
            token = jwt_encode({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {error: "invalid username and password"},status: :unprocessable_entity
        end

    end

    private
    def user_params
        params.require(:user).permit(:username,:password)
    end
end
