class User < ActiveRecord::Base

  has_many :urls

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user
      if @user.password == password
        return @user
      end
    end
    return nil
  end
end

