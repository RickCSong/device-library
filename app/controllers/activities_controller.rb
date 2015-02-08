class ActivitiesController < ApplicationController
  # GET /activities.json
  # TODO: Add permissions in future
  def index
    @activities = params[:ids] ? Activity.find(params[:ids]) : Activity.all
    respond_to do |format|
      format.json
    end
  end

  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    respond_to do |format|
      format.json
    end
  end
end
