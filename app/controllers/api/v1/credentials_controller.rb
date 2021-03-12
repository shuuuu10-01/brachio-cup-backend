class Api::V1::CredentialsController < ApplicationController

    def create
        user = User.first_or_create(uid: credential_params[:uid])
        user.google_access_token = credential_params[:google_access_token]

        head :ok
    end

    private

    def credential_params
        params.require(:user).permit(:uid, :google_access_token)
    end
end
