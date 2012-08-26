class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :omniauthable

  attr_accessible :login, :email, :password, :password_confirmation, :remember_me
  validates :login,     :presence => true,  :length => { :in => 3..15 }, :uniqueness => true
  validates :password,  :allow_nil => true, :length => { :in => 6..128 }
  validates :email,     :allow_nil => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  def self.from_omniauth params
    where(params.slice(:provider, :uid)).first_or_create do |user|
      user.provider = params.provider
      user.uid      = params.uid
      user.login    = params.info.nickname
      user.email    = params.info.email unless params.info.email.blank?
    end
  end

end
