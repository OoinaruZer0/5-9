class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :name, presence: true
         validates :name, presence: true, uniqueness: true,
         				  length: { minimum: 2, maximum: 20 }
          attachment :profile_image
end
