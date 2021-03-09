class ApplicationController < ActionController::API
    include AuthenticationHelper
    before_action :authenticate

    def authenticate
        puts verified_token
        set_current_user
    end

    def set_current_user
        @current_user if @current_user != nil
        @current_user ||- User.first_or_create(uid: verified_token[:sub])
    end

    def status_unauthorized
        head :unauthorized
    end
end
