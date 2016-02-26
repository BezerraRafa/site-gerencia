class UsersController < ApplicationController
    def new
        @user = User.new
    end
before_action :block_access, except: [:destroy]
    
    
    def create
        @user = User.find_by(email: params[:user][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
           
                    sign_in(@user)
        redirect_to @user
        else
            render 'new'              
        end
    end
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end

end
