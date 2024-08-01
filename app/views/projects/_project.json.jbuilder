json.extract! project, :id, :title, :description, :is_done, :attachment, :created_at, :updated_at
json.url project_url(project, format: :json)
json.attachment url_for(project.attachment)
