class ProductsController < ApplicationController
  
  before_filter :load_model, :only => [ :new, :edit, :create, :update, :destroy ]
  
  def index
    @page = (params[:page] || 1).to_i
    @products = if params[:q].blank?
      Product.paginate :order => 'name ASC', :per_page => 3, :page => @page
    else
      
      result = Product.solr_search do |s|
        s.keywords params[:q]
        unless params[:category_id].blank?
          s.with( :category_id ).equal_to( params[:category_id].to_i )
        else
          s.facet :category_id
        end
        s.paginate :per_page => 3, :page => @page
      end
      
      if result.facet( :category_id )
        @facet_rows = result.facet(:category_id).rows  
      end
      
      unless params[:category_id].blank?
        @category = Category.find( params[:category_id] )
      end
      
      result
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
  
  alias :update :create
  
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