ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body
  #
  # or
  #
  filter :title
  filter :created_at
  filter :updated_at

  permit_params do
    permitted = [:title, :body, :images]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end

  show do
    attributes_table do
      row :title
      row :body
      row :images do |post|
        image_tag(url_for(post.images.first))
      end
    end
  end

  form partial: 'form'
end
