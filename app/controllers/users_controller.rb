class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show, :destroy, :memberpage ]
  before_action :require_user, except: [:index, :show, :new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  #before_action :require_admin, only: [:destroy]
   
   
  
  def new
    @user = User.new
  end
  
  def create
    #debugger
    @user = User.new(user_params)
    @user.save
    #render plain: params#[:user]
    session[:user_id] = @user.id #for sign up and sign in
    flash[:success] = "User was successfully created"
    #@user = current_user 
    #redirect_to user_path(@user)
    redirect_to users_path
  end
  
  def edit
    #@user = User.find(params[:id])
    #@user = User.find(2)
  end
  
  def update
    #@user = User.find(params[:id])
    #@user = User.find(2)
    @user.update(user_params)
    redirect_to root_path
    #if @user.update(user_params)
       #redirect_to root_path
    #else
      #render "edit"
    #end  
  end
  
  def show
    #@user = User.find(params[:id])
    #@user = User.find(2)
  end
  
  def memberpage
    #@user = User.find(params[:id])
    #@users = User.all
  end
  
  def index
    #@users = User.paginate(page: params[:page], per_page: 5)
    @users = User.all
    #render plain: params#[:user]
    #@user = User.find(2)
    #@user = User.first
    #@user = User.last
    #@user = User.all
    #@user = User.find(params[:id])
  end
  
  def destroy
    #@user = User.find(params[:id])
    session[:user_id] = nil
    @user.destroy
    flash[:danger] = "User was successfully deleted"
    redirect_to users_path
  end
  

  
private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def require_same_user
    if current_user != @user and !current_user.admin? #would it matter if i put the keyword or instead of and?
    #flash[:danger] = "You can only edit your own account"
    redirect_to root_path
    end
  end
  
  #def require_admin
    #if logged_in? and !current_user.admin?
      #flash[:danger] = "Only admin users can perform that action"
     # redirect_to root_path
   # end
 # end
  
  def set_user
    @user = User.find(params[:id])
  end

end



      #Notes for users_controller.rb
#------------------------------------------#

#This is for dealing with users

#There are 7 actions:

#actions                          #path                     #url                 #function

#new                              signup_path               Get/signup           this page contains a form to create new user
#create                           users_path                Post/users           This action will post data in form from ui to database
#edit
#update
#destroy
#index
#show


      #Notes for rails console
#------------------------------------------#

#command                   #function
#user = User.new
#user.username
#user.email
#user.find(2)
#user.first
#user.last
#user.save
#User.all
#User
#user.destroy
#user.update
#
#
#
#




              #Notes for ruby?
#redirect_to path
#render "path"
#debugger
#flash
#params
#.require
#.permit
#==
#=
#!=
#!
#before_action
#only [:action]
#except [:action]
#


              #private methods ruby?
              
#user_params
#set_user
#require_user Can i use this for all controllers?
#require_same_user
#require_admin
#
#

