class TargetsController < ApplicationController
  def index
    @targets = Target.all
  end

  def show
    @target = Target.find(params[:id])
  end

  def new
    @topics = Topic.all
  end

  def edit
  end

  def update
  end
  def destroy
    @target = Target.find(params[:id])
    @target.destroy!
    flash[:notice] = "Target successfully deleted"
    redirect_to root_path
  end

  def create
    @target = current_user.targets.new(target_params)
    @radius = target_params[:area]
    @topic = target_params[:topic_id]
    @target_id = target_params[:id]

    respond_to do |format|
      if @target.save
        format.js
      else
        format.js
      end
    end
  end

  def load_create_target
    @topics = Topic.all
    @target = Target.new
    render json: { form: (render_to_string partial: 'create_target') }
  end
  def load_delete_target
    target_id = params[:target_id]
    @target = Target.find(target_id)
    render json: { target: (render_to_string partial: 'delete_target') }
  end
  def list
    @targets= current_user.targets
    render :json => @targets
  end

  private
  def target_params
    params.require(:target).permit(:id, :title, :topic, :area, :topic_id, :latitud, :longitud)
  end
end
