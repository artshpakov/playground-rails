class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable

  attr_accessible :login, :email, :password, :password_confirmation, :remember_me
  validates :login,     :presence => true,  :length => { :in => 3..15 }, :uniqueness => true
  validates :password,  :allow_nil => true, :length => { :in => 6..128 }
  validates :email,     :allow_nil => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

end
