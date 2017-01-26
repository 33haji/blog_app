class TipsController < ApplicationController
  before_action :set_tip, only: %w(edit update delete)
  
  def index
    @tips = Tip.all
  end
  
  def new
    @tip = Tip.new
  end
  
  def create
    @tip = Tip.new(tip_params)
    if @tip.save
      redirect_to tips_path
    else
      render 'new'
    end
  end
  
  def show
    @tip = Tip.find(params[:id])
  end
  
  def edit
  end
  
  def update
    if @tip.update(update_tip_params)
      redirect_to tips_path
    else
      render 'edit'
    end
  end
  
  def delete
    if @tip.update_attribute(:delete_flag, true)
      redirect_to tips_path
    else
      redirect_to tips_path, alert: '削除に失敗しました'
    end
  end
  
  private

    def tip_params
      params.require(:tip).permit(:title, :detail, :type)
    end
    
    def update_tip_params
      params.require(:tip).permit(:title, :detail, :type)
    end
    
    def set_tip
        @tip = Tip.find(params[:id])
    end
end