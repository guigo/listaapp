class Portal::ProductsController <  PortalController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
     @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
     @product = Product.new
  end

  def create
    @product = current_user.product.create(product_params)
    respond_to do |format|
      if @product.save
         format.html { redirect_to portal_products_path, notice: "Product was successfully created"}
         format.json { render :show, status: :created, location: @product}
      else
        format.html { render :new}
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
       if @product.update(product_params)
         format.html { redirect_to portal_products_path, notice: "Immobile was successfully updated." }
         format.json { render :show, status: :ok, location: @immobile }
       else
         byebug
         format.html { render :edit }
         format.json { render json: @product.errors, status: :unprocessable_entity }
       end
     end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to portal_products_path, notice: "Immobile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
     @product = Product.find(params[:id])
  end

  def product_params
     params.require(:product).permit(:code, :description, :price, :location, :amount)
  end
end
