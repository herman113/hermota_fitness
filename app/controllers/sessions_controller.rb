class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    #render "new"
    #debugger
    #render plain: params[:session].inspect
    # params is a hash that's being sent in when you submit the form, this is available to your app
    # the hash is called params and it will have values, but we don't simply want the 1st layer of params which is session in this case
    # we want the email from it, so we have to go two keys deep, ie params hash has session, then session hash has username/password as keys
    # this username and password keys within the session hash has values of actual username and password
    # since we use email for authentication in our app, we now have to look for the email (which is username) in our database
    # params = { :session => {username = 'Hermansoto@example.com', password = 'password'} }
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      #render plain: params#[:session]#[:user_id].inspect
      flash[:success] = "You have successfully logged in"
      redirect_to root_path#user_path(user)
    else
      #flash.now[:danger] = "There was something wrong with your login information"
      #render "new"
    end
  end
  
  def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    
  end


end

      #Notes for Sessions Controller
#------------------------------------------#

#This is for logging in

#There are 3 actions:

#actions                                    #path                     #url                 #function

#new                                      login_path              get/login(url)     This page contains a form to login a user
#create 
#destroy
#
#
#
#
#


    #Note for sessions_controller
#------------------------------------------#

#flash.now             is for immediate message flash not the next screen load
#flash                 is for message in the next screen load

#hash   key         value
#flash[:notice]    "stringvalue"

#hash        key        value
#flash.now[:danger]     "cant do that string"


      #Note for rails console
#------------------------------------------#

#
#user.authenticate"password" It will give a true or false value
#
#
#
#
#
#


      #Note for debugger in rails console
#------------------------------------------#

#command                              #function

#debugger in sessions_contoller.rb     pauses server  

#params                                gives all info in params hash

#hash1    hash2                  key        val           key          val
#params[:session]             {"email"=>"value@me.com", "password"=>"value"}

#hash1  hash2     key                     val
#params[:session][:email]               "value@me.com"

#hash1  hash2     key                     val
#params[:session][:password]            "password"

#control d                             release server from debugger
#
#