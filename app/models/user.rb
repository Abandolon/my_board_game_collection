class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  acts_as_messageable #allows Mailboxer gem to access model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :usersboardgames
  has_many :boardgames, through: :usersboardgames
  has_one :profile
  has_many :friends, source: :friends, foreign_key: :friend_id
  has_many :friends, source: :friends, foreign_key: :user_id
  has_many :availabilities
  validates :email, uniqueness: true


  def name
    raise
  end
  def mailboxer_email(object)
    object.email
    raise
  end
end
