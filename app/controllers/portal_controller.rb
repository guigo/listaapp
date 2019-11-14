class PortalController < ApplicationController
   before_action :authenticate_user!
   protect_from_forgery with: :exception

   include Portal::PortalHelper

   layout "portal"
end
