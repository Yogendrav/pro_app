class TasksController < ApplicationController
	before_filter :authenticate_user!
	def index
		# if params[:with] =="my_task"
		#   @tasks = current_user.tasks.paginate(:page => params[:page], :per_page => 3)
	 #  elsif params[:with] =="upcoming_task"
	 #  	@tasks = Task.find_by_status("Pending")
	 #  	@tasks = Task.paginate(:page => params[:page], :per_page => 3)
  #   elsif params[:with] =="completed_task"
	 #  	@tasks = Task.find_by_status("Completed")
		#   @tasks = Task.paginate(:page => params[:page], :per_page => 3)
		# else
		# 	@tasks = Task.paginate(:page => params[:page], :per_page => 3)
  #   end
    @tasks = Task.all
	end

	def new
		@task = Task.new
		# respond_to do |format|
  #     format.js
  #   end
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def create
		@project = Project.find(params[:task][:project_id])
		@task = @project.tasks.build(params[:task])
		if @task.save
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def update
		@task = Task.find(params[:id])
		if @task.update_attributes(:task)
			redirect_to task_path(@task)
		else
			render 'index'
		end
	end

	def destroy
		@task = Task.find(params[:id])
		if @task.delete
			redirect_to tasks_path
		else
			render 'index'
		end
	end
end
