class User < ActiveRecord::Base
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates_presence_of :name, :email, :presence => true
  validates :email, :uniqueness => { case_sensitive: false }, :format => { :with => email_regex }
  validates_presence_of :password, :on => :create
end
