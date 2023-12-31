# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end

  controller do
    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end
  end
end
