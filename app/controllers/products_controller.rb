class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  layout "home"

  def index
    # @products = Product.all
    # @products = current_user.products.order('created_at desc').page(params[:page])
    @users = User.all
    @products = current_user.products
  end

  def show
  end

  def new
    # @product = Product.new
    @product = current_user.products.new
  end

  def edit
  end

  def create
    # @product = Product.new(product_params)
    # @product.user_id = current_user.id 
    # @product = current_user.products.new(product_params)
    @product = current_user.products.build(product_params)
    @product.user_id = current_user.id 

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
      unless @product = current_user.products.where(id: params[:id]).first
        flash[:alert] = 'Product not found.'
        redirect_to root_url
      end
    end

    def product_params
      params.require(:product).permit(
        :name,
        :owner_id,
        :user_id,
        tasks_attributes: [
          :id,
          :_destroy,
          :name,
          sub_tasks_attributes: [
            :id,
            :_destroy,
            :name,
            :description,
            pre_tasks_attributes: [
              :name,
              :barcode,
              :description,
              :_destroy,
              properties_attributes: [
                :name,
                :value,
                :_destroy
              ]
            ]
          ]
        ],
        people_attributes: [
          :id,
          :name,
          :role,
          :description,
          :_destroy
        ],
        owner_attributes: [
          :id,
          :name,
          :role,
          :description,
          :_destroy
        ],
        product_tags_attributes: [
          :id,
          :_destroy,
          :tag_id,
          tag_attributes: [
            :id,
            :_destroy,
            :name
          ]
        ]
      )
    end
end
