ActiveAdmin.register AdminUser do
  permit_params :email, :names, :last_name, :password, :password_confirmation, :phone, :role

  index do
    selectable_column
    id_column
    column :role
    column :email
    column :names
    column :last_name
    column :phone
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :role

  form do |f|
    f.inputs do
      f.input :role
      f.input :email
      f.input :names
      f.input :last_name
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  controller do
    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end
  end
end
