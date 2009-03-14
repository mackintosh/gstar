class IndexController < ApplicationController
  def index
    @articles = Article.search(params[:search], params[:page]) 
  end
end
