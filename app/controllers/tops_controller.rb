class TopsController < ApplicationController
    def main
        if session[:login_uid]
           render 'main'
        else
            render 'login'
        end
    end
    
    def login
        login_password = BCrypt::Password.create("sanriko")
        if BCrypt::Password.new(login_password) == params[:pass]
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
