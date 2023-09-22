class ApplicationController < ActionController::API
    include JsonWebToken
    before_action :authenticate_request

    private
    def authenticate_request
      token = request.headers[:token]
      @user_id = jwt_decode(token)
      @current_user = User.find(@user_id)
    end
end
