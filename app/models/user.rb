class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Do NOT touch these devise things
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
