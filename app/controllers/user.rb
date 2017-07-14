get '/users/new' do
  erb :'/users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

post '/users' do

  if request.xhr?
    @user = User.create({params[:first_name]})
    if @user.save
      session[:user_id] = @user.id
    else
      @errors = @user.errors.full_messages
      erb :index
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

