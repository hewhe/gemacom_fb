class TasksController < ApplicationController
    before_action :authenticate_user
    before_action :correct_user, only: [:update, :destroy]
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        task = Task.new(task_params)
        task.user_id = current_user.id
        task.save
        redirect_to(tasks_path)
    end

    def update
        task = Task.find(params[:id])
        task.update(task_params)
        # task.content = params[:task][:content] updateの異なる書き方
        # task.save
        redirect_to(tasks_path)
    end

    def destroy
        task = Task.find(params[:id])
        task.destroy
        redirect_to(tasks_path)
    end

    private
    def task_params
        params.require(:task).permit(:content)
    end

    def correct_user
        task = Task.find_by(id: params[:id])
        if current_user.id != task.user.id
            redirect_to(root_path)
        end
    end
end
