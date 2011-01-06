class ProductsController < ApplicationController
  
  before_filter :load_model, :only => [ :new, :edit, :create, :update, :destroy ]
  
  def index
    @products = if params[:q].blank?
      Product.all :order => 'name ASC'
    else
      Product.solr_search do |s|
        s.keywords params[:q]
      end
    end
  end

  def new
    render :new
  end

  alias :edit :new

  def create
    if @product.update_attributes( params[:product] )
      flash[:notice] = 'Product successfully created/updated'
      redirect_to products_path
    else
      render :new
    end
  end
  
  def destroy
    @product.destroy
    flash[:notice] = 'Product successfully removed'
    redirect_to products_path
  end
  
  protected
  
  def load_model
    @product = params[:id].blank? ? Product.new : Product.find( params[:id] )
  end
  
end