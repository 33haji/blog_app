class ManageController < ApplicationController
  def table_list
    @table_list = ActiveRecord::Base.connection.tables
  end
  
  def column_list
    @table_name = params[:table]
  end
  
end