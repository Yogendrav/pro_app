class Task < ActiveRecord::Base
  attr_accessible :all_project, :ends_on, :project_id, :starts_on, :task_created_by, :task_created_on, :task_details, :title
  belongs_to :project
end
