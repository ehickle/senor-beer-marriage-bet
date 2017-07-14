get '/picks' do
  @users = User.all
  p @users
  erb :'/picks/show'
end

get '/picks/new' do
  @choices = ['Wyatt', 'Max', 'Evan', 'Pat', 'Stuart', 'Bobby','Tucker','Brennan','Nik','Ricky','Cole', 'Dennis']
  erb :'/picks/new'
end

post '/picks' do
  p params
  params.each do |pick, name|
    current_user.picks.create(name: name)
  end

  if current_user.picks.count == 12
    redirect "/users/#{current_user.id}"
  else
    current_user.picks.clear
    @errors = ['A member can not be chosen more than once']
    @choices = ['Wyatt', 'Max', 'Evan', 'Pat', 'Stuart', 'Bobby','Tucker','Brennan','Nik','Ricky','Cole', 'Dennis']
    erb :'/picks/new'
  end
end
