class TasksController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show]
  #applicationcontrollerを継承している
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
      @tasks = current_user.tasks.order(id: :desc)  # form_with 用
      #task全て集める
  end

  def show
  end

  def new
      @task= Task.new 
      #新しくtask作る
  end

  def create
    @task = current_user.tasks.build(task_params) #新しく作ったタスクのデータ集めてきて(contentとstatusの)
    if @task.save
      flash[:success] = 'Task が正常に投稿されました' 
      #flashは少しメッセージを表示するときに使う
      redirect_to @task #showページとばす
    else
      @tasks = current_user.tasks.order(id: :desc)
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new #newページ表示する
      
      #redirectのときは長く表示されるflash,renderの時は少しだけ表示されるflash.now
    end
  end

  def edit
      
  end

  def update
      
    if @task.update(task_params) 
      #更新したタスクのデータを集めて
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit　#editページ
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to @task #showアクションに飛んでからshowページに
  end
  
  private
  def set_task
    @task = Task.find(params[:id])
    #idにあったデータを探してきて！とモデルに言ってる
  end
  
  def task_params #Strong parameter,セキュリティ対策
    params.require(:task).permit(:content, :status)
    #送られてきたデータを全て受け入れるのではなくて、特定のデータだけ受け取るよ！というもの、
    #contentとstatus以外のカラムを無視する
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end


