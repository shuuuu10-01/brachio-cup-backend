class Api::V1::UsersController < ApplicationController
  def index
    @user = User.all()
    render json: { status: 'SUCCESS', data: user }
  end

  def create
    user = User.find_by(uid: user_params['uid'])
    if user #すでに登録されている時の処理
      if user.update(user_params)
        render json: { status: 'SUCCESS', data: user }
      else
        render json: { status: 'ERROR', message: 'userの更新に失敗しました。' }
      end
    else #新規登録の時の処理
      user_new = User.new(user_params)
      if user_new.save
        render json: { status: 'SUCCESS', data: user_new }
      else
        render json: { status: 'ERROR', message: 'userの追加に失敗しました。' }
      end
    end
  end

  def user_params
    params.require(:user).permit(:uid,:google_access_token,:id_token)
  end
end
