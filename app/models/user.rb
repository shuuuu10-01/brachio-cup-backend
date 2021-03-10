class User < ApplicationRecord
  validates :uid,  presence: true,uniqueness: true #同じuidが保存されないようにする
  validates :google_access_token, presence: true 
  validates :id_token, presence: true
end
