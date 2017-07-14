get '/picks/new' do
  @choices = ['Wyatt', 'Max', 'Evan', 'Pat', 'Stuart', 'Bobby','Tucker','Brennan','Nik','Ricky','Cole', 'Dennis']
  erb :'/picks/new'
end

post '/picks' do
  p params
  params.each do |pick, name|
    current_user.picks.create(name: name)
  end

  redirect "/users/#{current_user.id}"
end
