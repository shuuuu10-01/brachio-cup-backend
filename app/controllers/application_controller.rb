class ApplicationController < ActionController::API
    include AuthenticationHelper
    before_action :authenticate

    def authenticate
        set_current_user
    end

    def set_current_user
        @current_user if @current_user != nil
        puts 'verified_token'
        # puts verified_token[0]['firebase']['user_id']
        puts verified_token[1]
        puts '---'
        puts verified_token[0]
        # puts verified_token[0]['user_id']
        puts '---'
        @current_user ||= User.first_or_create(uid: verified_token[0]['user_id'])
    end

    def status_unauthorized
        head :unauthorized
    end
end
