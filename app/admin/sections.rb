ActiveAdmin.register Section do
  menu label: proc { I18n.t("active_admin.sections") }

  actions :all, except: [:destroy]

  permit_params :name

  member_action :delete_element, method: :delete do
    if resource.destroy
      redirect_to admin_sections_path, notice: 'Show element deleted successfully.'
    else
      redirect_to admin_sections_path, alert: 'Failed to delete show element.'
    end
  end

  show do
    attributes_table do
      row :name
    end

    div do
      button_to 'Delete', delete_element_path, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end

  controller do
    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end
  end
end
