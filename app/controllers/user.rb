get '/users/new' do
  erb :'/users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

post '/users' do

  if request.xhr?
    name = FB.api('/me')
    p name
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

