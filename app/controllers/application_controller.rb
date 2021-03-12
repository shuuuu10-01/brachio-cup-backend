class ApplicationController < ActionController::API
    include AuthenticationHelper
    before_action :authenticate

    def authenticate
        set_current_user
    end

    def set_current_user
        @current_user if @current_user != nil
        @current_user ||= User.first_or_create(uid: verified_token[0]['user_id'])
    end

    def status_unauthorized
        head :unauthorized
    end
end
