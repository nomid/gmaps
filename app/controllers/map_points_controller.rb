class MapPointsController < ApplicationController
  # GET /map_points
  # GET /map_points.json
  def index
    @map_points = MapPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @map_points }
    end
  end

  # GET /map_points/1
  # GET /map_points/1.json
  def show
    @map_point = MapPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @map_point }
    end
  end

  # GET /map_points/new
  # GET /map_points/new.json
  def new
    @map_point = MapPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map_point }
    end
  end

  # GET /map_points/1/edit
  def edit
    @map_point = MapPoint.find(params[:id])
  end

  # POST /map_points
  # POST /map_points.json
  def create
    @map_point = MapPoint.new(params[:map_point])

    respond_to do |format|
      if @map_point.save
        format.html { redirect_to @map_point, notice: 'Map point was successfully created.' }
        format.json { render json: @map_point, status: :created, location: @map_point }
      else
        format.html { render action: "new" }
        format.json { render json: @map_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /map_points/1
  # PUT /map_points/1.json
  def update
    @map_point = MapPoint.find(params[:id])

    respond_to do |format|
      if @map_point.update_attributes(params[:map_point])
        format.html { redirect_to @map_point, notice: 'Map point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /map_points/1
  # DELETE /map_points/1.json
  def destroy
    @map_point = MapPoint.find(params[:id])
    @map_point.destroy

    respond_to do |format|
      format.html { redirect_to map_points_url }
      format.json { head :no_content }
    end
  end
end
