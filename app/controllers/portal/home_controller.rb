class Portal::HomeController < PortalController
  def index
    @products = Product.all
  end
end
