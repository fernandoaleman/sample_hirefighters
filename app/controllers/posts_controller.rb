class PostsController < ApplicationController
  
  before_filter :load
  
  def load
    @posts = Post.all.paginate(:per_page => 5, :page => params[:page].to_i.zero? ? 1 : params[:page].to_i)
    @post  = Post.new
    
    if params[:page] && (params[:page].to_i >= 1)
      @page = params[:page].to_i.zero? ? 1 : params[:page].to_i
      session[:page] = @page
    elsif session[:page]
      @page = session[:page]
    else
      @page = 1
    end
  end
  
  def index
  end
  
  def show
    render :action => "index"
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      @posts = Post.all.paginate(:per_page => 5, :page => @page)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      @posts = Post.all.paginate(:per_page => 5, :page => @page)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @posts = Post.all.paginate(:per_page => 5, :page => @page)
  end
end
