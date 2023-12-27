ActiveAdmin.register Article do
  permit_params :title, :author, :content, :social_media_contact, :foot_note, :image
  actions :all, except: [:destroy]

  filter :title
  filter :author
  filter :social_media_contact

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :social_media_contact

    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :author
      f.input :content
      f.input :social_media_contact
      f.input :foot_note
      f.input :image, as: :file
    end

    f.actions
  end

  member_action :delete_article_element, method: :delete do
    if resource.destroy
      redirect_to admin_articles_path, notice: 'Show element deleted successfully.'
    else
      redirect_to admin_articles_path, alert: 'Failed to delete show element.'
    end
  end

  show do
    attributes_table do
      row :image do |resource|
        image_tag resource.image.thumb.url if resource.image?
      end
      row :title
      row :author
      row :content
      row :social_media_contact
      row :foot_note
    end

    div do
      button_to 'Delete', delete_article_element_path, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
