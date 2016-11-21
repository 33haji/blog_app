class BlogsController < ApplicationController
  before_action :set_blog, only: %w(edit update delete)
  
  def index
    @q = Blog.ransack(params[:q])
    blogs = @q.result.order(created_at: :desc)
    
    if !params[:q].nil? && params[:q][:delete_flag_eq] == 'true'
      blogs = Blog.all.order(created_at: :desc)
    elsif params[:q].nil?
      blogs = Blog.where(delete_flag: false).order(created_at: :desc)
    end
    
    @blogs = blogs
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end
  
  def delete
    if @blog.update_attribute(:delete_flag, true)
      redirect_to blogs_path
    else
      redirect_to blogs_path, alert: '削除に失敗しました'
    end
  end
  
  private

    def blog_params
      params.require(:blog).permit(:title, :body)
    end
    
    def set_blog
        @blog = Blog.find(params[:id])
    end
end