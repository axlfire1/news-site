ActiveAdmin.register Section do
  permit_params :name

  def self.ransackable_attributes(auth_object = nil)
    super & ['name']
  end
end
