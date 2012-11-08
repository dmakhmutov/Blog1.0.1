ActiveAdmin.register Post do
  index do
    column  :id
    column  :title
    column  :name
    column  :created_at
    column  :updated_at
    default_actions
  end

end
