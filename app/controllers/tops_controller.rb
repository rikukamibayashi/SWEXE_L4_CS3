class TopsController < ApplicationController
    def main
        if session[:login_uid]
           render 'main'
        else
            render 'login'
        end
    end
    
    def login
        signup_password = BCrypt::Password.create("sanriko")
        
        login_password = BCrypt::Password.new(signup_password)
        if login_password == params[:pass]
            p "logged in!"
        #if User.find_by(uid: params[:uid], pass: params[:pass])
        #if params[:uid] == 'kindai' and params[:pass] == 'sanriko'
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render 'error'
        end
    end
    
    def logout
       session.delete(:login_uid) 
       redirect_to root_path
    end
end
