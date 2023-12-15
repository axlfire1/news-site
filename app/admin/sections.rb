ActiveAdmin.register Section do
  actions :all, except: [:destroy]

  permit_params :name

  member_action :delete_element, method: :delete do
    if resource.destroy
      redirect_to delete_element_path, notice: 'Show element deleted successfully.'
    else
      redirect_to section_path, alert: 'Failed to delete show element.'
    end
  end

  show do
    attributes_table do
      row :name
    end

    div do
      button_to 'Delete Show Element', section_path(resource), method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
