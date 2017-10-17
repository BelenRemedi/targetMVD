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
  end

  def create
    @target = current_user.targets.new(target_params)
    @radius = target_params[:area]
    @topic = target_params[:topic_id]

    respond_to do |format|
      if @target.save
        format.js
      else
        puts "@target.errors"+@target.errors.to_json
        format.js
      end
    end
  end

  def load_create_target
    @topics = Topic.all
    @target = Target.new
    render json: { form: (render_to_string partial: 'create_target') }
  end
  def list
    @targets= current_user.targets
    render :json => @targets
  end

  private
  def target_params
    params.require(:target).permit(:title, :topic, :area, :topic_id, :latitud, :longitud)
  end
end
