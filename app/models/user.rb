class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :workers
  has_many :reviews
  has_many :reviewws
  has_many :payments
  has_many :blocks
  has_many :likes
  has_many :buys


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         def name
          return self.email.split('@')[0].capitalize
        end


end
