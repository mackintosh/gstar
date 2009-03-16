class IndexController < ApplicationController
  def index
    @articles = Article.search(params[:search], params[:page])
    @sponsors = Sponsor.find(:all, :order => "RAND()", :limit => 5)
  end
end
