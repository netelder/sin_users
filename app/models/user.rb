class User < ActiveRecord::Base

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



__END__

  def login
    
    
      session[:user_id] = @user.id
      redirect "/login/#{@user.id}"
    else
      redirect '/'
    end
  end
