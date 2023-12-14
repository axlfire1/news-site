ActiveAdmin.register NewsWall do
  index do
    selectable_column
    id_column
    column :slogan
    column :title
    column :subtitle
    column :author
    column :content
    column :section

    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

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
end
