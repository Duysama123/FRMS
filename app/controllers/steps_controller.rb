class StepsController < ApplicationController
  before_action :set_step, only: %i[show edit update destroy]
  before_action :set_recipe, only: [:show_steps]  # Chỉ gọi set_recipe cho show_steps

  # GET /steps or /steps.json
  def index
    # Kiểm tra nếu có recipe_id trong URL
    if params[:recipe_id].present?
      @recipe = Recipe.find(params[:recipe_id])
      @steps = @recipe.steps
    else
      @steps = Step.all  # Nếu không có recipe_id, hiển thị tất cả các bước
    end
  end

  # GET /steps/1 or /steps/1.json
  def show
    @step = Step.find(params[:id])
    @recipe = @step.recipe # Gắn recipe liên kết với step
  end

  # GET /steps/new
  def new
    @step = Step.new
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps or /steps.json
  def create
    @step = Step.new(step_params)

    # Log params for debugging
    Rails.logger.debug("Step Params: #{step_params.inspect}")

    respond_to do |format|
      if @step.save
        format.html { redirect_to step_url(@step), notice: "Step was successfully created." }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1 or /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to step_url(@step), notice: "Step was successfully updated." }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1 or /steps/1.json
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: "Step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Action mới: hiển thị các bước của recipe dưới dạng giao diện đẹp mắt
  def show_steps
    # Sử dụng begin-rescue để xử lý khi không tìm thấy recipe
    begin
      @recipe = Recipe.find(params[:recipe_id])  # Tìm recipe dựa trên params[:recipe_id]
      @steps = @recipe.steps
    rescue ActiveRecord::RecordNotFound
      redirect_to recipes_path, alert: "Recipe not found"
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    def set_recipe
      # Tìm kiếm recipe theo params[:recipe_id], chỉ sử dụng cho show_steps
      begin
        @recipe = Recipe.find(params[:recipe_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to recipes_path, alert: "Recipe not found"  # Điều hướng về danh sách recipes nếu không tìm thấy
      end
    end

    # Only allow a list of trusted parameters through.
    def step_params
      params.require(:step).permit(:recipe_id, :name, :position, :instruction, :image, :cook_method_id)
    end
end
