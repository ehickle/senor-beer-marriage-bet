get '/' do
  if request.xhr?
    @errors = params[errors]
  end
  erb :index
end
