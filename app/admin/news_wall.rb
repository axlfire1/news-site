ActiveAdmin.register NewsWall do
  permit_params :slogan, :title, :subtitle, :author, :content, :section_id

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  index do
    selectable_column
    id_column
    column :slogan
    column :title
    column :subtitle
    column :author
    column :content
    column :section.name

    actions
  end

  form do |f|
    f.inputs do
      f.input :slogan
      f.input :title
      f.input :subtitle
      f.input :author
      f.input :content
      f.input :section, as: :select, collection: Section.all.order(name: :asc).map { |s| [s.name, s.id] }
    end

    f.actions
  end

  member_action :delete_news_wall_element, method: :delete do
    if resource.destroy
      redirect_to admin_news_walls_path, notice: 'Show element deleted successfully.'
    else
      redirect_to admin_news_walls_path, alert: 'Failed to delete show element.'
    end
  end

  show do
    attributes_table do
      row :slogan
      row :title
      row :subtitle
      row :author
      row :content
      row :section do |row|
        row.section&.name
      end
    end

    div do
      button_to 'Delete', delete_news_wall_element_path, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end