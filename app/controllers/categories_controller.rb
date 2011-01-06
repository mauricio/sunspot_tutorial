
class CategoriesController < ApplicationController
  
  before_filter :load_model, :only => [ :new, :edit, :create, :update, :destroy ]
  
  def index
    @categories = Category.all( :order => 'name ASC' )
  end
  
  def new
    render :new
  end
  
  alias :edit :new
  
  def create
    if @category.update_attributes( params[:category] )
      flash[:notice] = "Category saved/updated successfully"
      redirect_to categories_path
    else 
      render :new
    end
  end
  
  alias :update :create
  
  def destroy
    @category.destroy
    flash[:notice] = 'Category successfully removed'
    redirect_to categories_path
  end
  
  protected
  
  def load_model
    @category = params[:id].blank? ? Category.new : Category.find( params[:id] )
  end
  
end