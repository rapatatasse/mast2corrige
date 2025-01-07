class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.where(user_id: current_user.id)
    if params[:query].present?

      @products = @products.search_products_all(params[:query]) if params[:query].present?
    
    end

  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @users = User.all
  end

  # GET /products/1/edit
  def edit
    @users = User.all
  end


  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def soldes
    
    #solde les produit du current_user de 20%
    @products = Product.where(user_id: current_user.id)
    @products.each do |product|
      product.price = product.price * 0.8
      product.save!
    end
    redirect_to products_path, status: :see_other, notice: "Product was successfully updated."
  end
  def soldesselection
    product_ids = JSON.parse(params[:products] || '[]')
    @products = Product.where(id: product_ids)
    
    @products.each do |product|
      product.price = product.price * 0.8
      product.save!
    end
    redirect_to products_path, notice: "Les produits sélectionnés ont été mis en solde"
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.where(user_id: current_user.id).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity)
    end
end
