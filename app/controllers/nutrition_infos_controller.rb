class NutritionInfosController < ApplicationController
  before_action :set_nutrition_info, only: %i[ show edit update destroy ]

  # GET /nutrition_infos or /nutrition_infos.json
  def index
    @nutrition_infos = NutritionInfo.all
  end

  # GET /nutrition_infos/1 or /nutrition_infos/1.json
  def show
    @nutrition_info = NutritionInfo.find(params[:id])
  end

  # GET /nutrition_infos/new
  def new
    @nutrition_info = NutritionInfo.new
  end

  # GET /nutrition_infos/1/edit
  def edit
  end

  # POST /nutrition_infos or /nutrition_infos.json
  def create
    @nutrition_info = NutritionInfo.new(nutrition_info_params)

    respond_to do |format|
      if @nutrition_info.save
        format.html { redirect_to nutrition_info_url(@nutrition_info), notice: "Nutrition info was successfully created." }
        format.json { render :show, status: :created, location: @nutrition_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nutrition_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nutrition_infos/1 or /nutrition_infos/1.json
  def update
    respond_to do |format|
      if @nutrition_info.update(nutrition_info_params)
        format.html { redirect_to nutrition_info_url(@nutrition_info), notice: "Nutrition info was successfully updated." }
        format.json { render :show, status: :ok, location: @nutrition_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nutrition_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutrition_infos/1 or /nutrition_infos/1.json
  def destroy
    @nutrition_info.destroy

    respond_to do |format|
      format.html { redirect_to nutrition_infos_url, notice: "Nutrition info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nutrition_info
      @nutrition_info = NutritionInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nutrition_info_params
      params.require(:nutrition_info).permit(:ingredient_id, :calories, :protein, :carbs, :fat, :sugar, :fiber, :base_unit)
    end
end
