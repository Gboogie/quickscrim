class User < ActiveRecord::Base
  has_many :scrimmages
  has_many :friendships
  has_many :direct_messages, :through => :friendships

  has_secure_password
  attr_reader :password_hash
  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
