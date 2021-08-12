ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :unit_price, :category_id, :released_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :unit_price, :category_id, :released_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  scope :unreleased
  scope :all
  index do
    column :title
    column :unit_price do |product|
      div class: 'currency-div' do
        number_to_currency product.unit_price
      end
    end
    column :category
    column "Released Date", :released_at
    actions
  end

  
end
