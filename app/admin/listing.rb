ActiveAdmin.register Listing do

 permit_params :title, :private_room_or_entire_home, :photos, :description, :bedrooms, :bathrooms, :beds, :max_occupants, :neighborhood, :city, :policies, :default_price_per_night, :nights_available, :price, :host_id

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
