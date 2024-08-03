json.extract! task, :id, :title, :description, :is_done, :attachment, :created_at, :updated_at
json.url task_url(task, format: :json)
json.attachment url_for(task.attachment)
