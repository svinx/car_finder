class ArticlesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]

  def new
    @title = "Create A New Car Article"
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Success! Article created"
      redirect_to "/car-articles/#{@article.permalink}/"
    else
      flash[:notice] = "The article was not saved"
      redirect_to :back
    end
  end

  def show
    @article     = Article.find_by_permalink!(params[:id])
    @title       = @article.title
    @description = @article.description
    @keywords    = @article.keywords
  end

  def edit
    @article = Article.find_by_permalink!(params[:id])
  end

  def update
    @article = Article.find_by_permalink!(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "The article was successfully updated"
      redirect_to "/car-articles/#{@article.permalink}/"
    else
      flash[:notice] = "Article Didn't Save!"
      redirect_to :back
    end
  end

  def index
    @title       = "Tips Buying A Car Or Truck In Utah"
    @description = "A collection of articles to help Utah car buyers find a great car."
    @keywords    = "Utah, Cars, Trucks, Buying, Research, Financing, Car Loans"
  end

  def destroy
    @article = Article.find_by_permalink!(params[:id])
    if @article.destroy
      flash[:notice] = "The article was deleted"
      redirect_to "/how-many-articles"
    else
      flash[:notice] = "The article was deleted"
      redirect_to :back
    end
  end

  def all_articles
    @articles = Article.all
  end

end
