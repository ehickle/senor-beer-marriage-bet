get '/users/new' do
  erb :'/users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

post '/users' do

  if request.xhr?
    user_exist = User.find_by(username: params[:first_name])
    if user_exist == nil
      @user = User.new({username: params[:first_name]})
      if @user.save
        session[:user_id] = @user.id
        redirect '/'
        200
      else
        @errors = @user.errors.full_messages
        p @errors
        200
      end
    else
      session[:user_id] = user_exist.id
      redirect '/'
      200
    end
  else
    @user = User.new(params[:user])

    if @user.save
      redirect "/sessions/new"
    else
      @errors = @user.errors.full_messages
      erb :'/users/new'
    end
  end
end

