class UserController < ApplicationController 

  get '/registration' do
    if logged_in?
      redirect '/lists'
    else
    erb :'users/registration'
    end
  end


  post '/registration' do
    if params[:name] == "" || params[:email] == "" || params[:password] == "" || params[:repeated_password] == ""
      redirect to '/'
    else
      @user=User.create(:full_name => params[:name], :email => params[:email], :password =>params[:password])
     session[:user_id] = @user.id 
     redirect to '/profile'
    end
  end

  get '/logout' do
    session.destroy
    redirect to '/'
  end

  post '/signin' do
    if params[:name] == "" || params[:email] == "" || params[:password] == "" || params[:repeated_password] == ""
      redirect to '/'
    else
      @user=User.create(:full_name => params[:name], :email => params[:email], :password => params[:password])
     session[:user_id] = @user.id 
     redirect to '/profile'
    end
  end

  post '/login' do
    @user = User.find(session['user_id'])
    redirect to '/profile'
  end

  get '/profile' do
    @user = User.find(session['user_id'])
    erb :'users/profile'
  end


end
