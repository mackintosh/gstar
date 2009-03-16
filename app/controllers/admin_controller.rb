class AdminController < ApplicationController
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
	session[:user_id] = user.id
	uri = session[:original_uri]
	session[:original_uri] = nil
	redirect_to(uri || {:action => "index"})
      else
	flash.now[:notice] = "Invalid username or password"
      end
    end
  end

  def logout
  end

  def index
    @articles = Article.count
  end

end
