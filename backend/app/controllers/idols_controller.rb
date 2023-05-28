class IdolsController < ApplicationController
  before_action :set_idol, only: [:show, :update, :destroy]

  # GET /idols
  def index
    @idols = Idol.all

    render json: @idols
  end

  # GET /idols/1
  def show
    render json: @idol
  end

  # POST /idols
  def create
    @idol = Idol.new(idol_params)

    if @idol.save
      render json: @idol, status: :created, location: @idol
    else
      render json: @idol.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /idols/1
  def update
    if @idol.update(idol_params)
      render json: @idol
    else
      render json: @idol.errors, status: :unprocessable_entity
    end
  end

  # DELETE /idols/1
  def destroy
    @idol.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idol
      @idol = Idol.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def idol_params
      params.require(:idol).permit(:name, :image, :detail)
    end
end
