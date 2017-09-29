class TargetsController < ApplicationController
  def index
    @targets = Target.all
  end

  def show
    @target = Target.find(params[:id])
  end

  def new
    #lat = params[:lat]

    #@target = Target.new(lat:lat)
    @topics = Topic.all
  end

  def edit
  end

  def update
  end
  def destroy
  end

  def create
    @target = Target.new(target_params)
    @radius = target_params[:area]
    @topic = target_params[:topic_id]

    puts "target_params______"+target_params.to_json

    respond_to do |format|
      if @target.save
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  def load_create_target
    @topics = Topic.all
    @target = Target.new
    puts "tager______"+@target.to_json
    render json: { form: (render_to_string partial: 'create_target') }
  end
  private
  def target_params
    params.require(:target).permit(:title, :topic, :area, :topic_id)
  end
end
