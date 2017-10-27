class TargetsController < ApplicationController
  helper_method :target
  helper_method :targets

  def index; end

  def show; end

  def new
    @topics = Topic.all
  end

  def edit; end

  def update; end

  def destroy
    respond_to do |format|
      if target.destroy
        format.js do
          flash[:notice] = 'Target successfully deleted!'
          render :'redirect.js.erb'
        end
      else
        format.js { flash[:error] = 'Action failed' }
      end
    end
  end

  def create
    respond_to do |format|
      @target = current_user.targets.create(target_params)
      format.js
    end
  end

  def load_create_target
    topics = Topic.all
    Target.new
    render json: { form: (render_to_string partial: 'create_target', locals: { topics: topics }) }
  end

  def load_delete_target
    target = Target.find(params[:target_id])
    render json: { target: (render_to_string partial: 'delete_target', locals: { target: target }) }
  end

  def list
    render json: targets
  end

  private

  def target
    @target ||= Target.find(params[:id])
  end

  def targets
    @targets ||= current_user.targets
  end

  def target_params
    params.require(:target).permit(:id, :title, :topic, :area, :topic_id, :latitud, :longitud)
  end
end
