ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :names, :last_name, :phone

  index do
    selectable_column
    id_column
    column :email
    column :names
    column :last_name
    column :phone
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :names
      f.input :last_name
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  def self.ransackable_attributes(auth_object = nil)
    super & ['email', 'phone', 'names']
  end

end
