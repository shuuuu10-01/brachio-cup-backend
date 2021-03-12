module AuthenticationHelper

    def verified_token
        Firebase::Auth::IDTokenKeeper::IDToken.new(token).verified_id_token
    end

    def token
        status_unauthorized if !request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ')[1]
    end
end
