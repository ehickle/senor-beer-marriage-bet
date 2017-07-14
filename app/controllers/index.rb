get '/' do
  sessions[:user_id] = nil
  erb :index
end
