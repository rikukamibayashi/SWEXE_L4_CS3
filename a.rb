require 'bcrypt'

signup_password = BCrypt::Password.create("sanriko")
puts signup_password

login_password = BCrypt::Password.new(signup_password)
if login_password == "sanriko" #←login_password.==("my password")  #params[:pass]
    p "ログイン成功"
end