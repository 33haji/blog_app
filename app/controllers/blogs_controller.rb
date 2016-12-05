class BlogsController < ApplicationController
  before_action :set_blog, only: %w(edit update delete)
  
  def index
    @q = Blog.ransack(params[:q])
    blogs = @q.result
    
    if !params[:q].nil? && params[:q][:delete_flag_eq] == 'true'
      blogs = Blog.all
    elsif params[:q].nil?
      blogs = Blog.where(delete_flag: false)
    end
    
    @works = Work.all
    @blogs = blogs.page(params[:page]).order(created_at: :desc)
  end
  
  def new
    @blog = Blog.new
    @blog.build_work
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
  end
  
  def update
    if @blog.update(update_blog_params)
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
      params.require(:blog).permit(:title, :body, :image, :image_cache, :remove_image, work_attributes: [:required_time])
    end
    
    def update_blog_params
      params.require(:blog).permit(:title, :body, :image, :image_cache, :remove_image, work_attributes: [:required_time, :id])
    end
    
    def set_blog
        @blog = Blog.find(params[:id])
    end
end