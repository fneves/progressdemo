class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :load_parent

  # GET /progress_bars/1/tasks
  # GET /progress_bars/1/tasks.json
  def index
    @tasks = @progress_bar.tasks.all
  end

  # GET /progress_bars/1/tasks/1
  # GET /progress_bars/1/tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @progress_bar.tasks.build
  end

  # GET /progress_bars/1/tasks/1/edit
  def edit
  end

  # POST /progress_bars/1/tasks
  # POST /progress_bars/1/tasks.json
  def create
    @task = @progress_bar.tasks.create(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to progress_bar_url(@progress_bar), notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progress_bars/1/tasks/1
  # PATCH/PUT /progress_bars/1/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to progress_bar_url(@progress_bar), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progress_bars/1/tasks/1
  # DELETE /progress_bars/1/tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to progress_bar_tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def load_parent
      @progress_bar = ProgressBar.find(params[:progress_bar_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :duedate, :body, :status)
    end
end
