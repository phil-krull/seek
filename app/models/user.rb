class User < ActiveRecord::Base
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :presence => true
  validates :email, :uniqueness => { case_sensitive: false }, :format => { :with => email_regex }
  # validates :password, :presence => true, on: :update, allow_blank: true
  validates_presence_of :password, :on => :create
end
