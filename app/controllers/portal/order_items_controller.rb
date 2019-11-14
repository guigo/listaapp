class Portal::OrderItemsController < PortalController
  def create
    @order = current_order
		@order_item = @order.order_items.new(order_item_params)
    @product = Product.find(order_item_params[:product_id])
		if @product.amount > 0
       @order.save
       @product.amount - 1
       @product.save
    end
		session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order_item.order_items
    @product = Product.find(order_item_params[:product_id])
    if @product.amount > 0
       @order.save
       @product.amount - 1
       @product.save
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    @product.amount - 1
    @product.save
  end

  private
    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity)
    end
end
