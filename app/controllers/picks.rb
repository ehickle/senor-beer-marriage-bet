get '/picks/new' do
  @choices = ['Wyatt', 'Max', 'Evan', 'Pat', 'Stuart', 'Bobby','Tucker','Brennan','Nik','Ricky','Cole', 'Dennis']
  erb :'/picks/new'
end

post '/picks' do
  "hello World"
end
