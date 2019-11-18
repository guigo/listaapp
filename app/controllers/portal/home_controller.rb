class Portal::HomeController < PortalController
  def index
    @products = Product.available
    @order_item = current_order.order_items.new
  end
end
