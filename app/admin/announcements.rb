ActiveAdmin.register Announcement do
  actions :all, except: [:destroy]

  permit_params :section_id, :is_enabled, :is_global, :customer_name, :customer_url

  member_action :delete_announcement_element, method: :delete do
    if resource.destroy
      redirect_to admin_announcements_path, notice: 'Show element deleted successfully.'
    else
      redirect_to admin_announcements_path, alert: 'Failed to delete show element.'
    end
  end

  show do
    attributes_table do
      row :section_id
      row :is_enabled
      row :is_global
      row :customer_name
      row :customer_url
    end

    div do
      button_to 'Delete', delete_announcement_element_path, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
