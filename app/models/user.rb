class User < ActiveRecord::Base
	attr_accessor :gauth_token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :google_authenticatable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
