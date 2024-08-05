class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy toggle_done ]
  before_action :authenticate_user!

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.for_user(current_user).includes(:project, :tags)
    @tasks = @tasks.is_done(params[:done]) if params[:done]
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @projects = Project.for_user(current_user)
    @tags = Tag.for_user(current_user)
  end

  # GET /tasks/1/edit
  def edit
    @tags = Tag.for_user(current_user)
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_done
    respond_to do |format|
      if @task.toggle!(:is_done)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@task,
                                                    partial: params[:partial] || "task",
                                                    locals: { task: @task })
        end
        format.html { redirect_to url_for, notice: "'Done' status successfully updated." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :is_done, :attachment, :project_id, tag_ids: [])
    end
end
