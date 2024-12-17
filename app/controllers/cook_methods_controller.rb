class CookMethodsController < ApplicationController
  before_action :set_cook_method, only: %i[ show edit update destroy ]

  # GET /cook_methods or /cook_methods.json
  def index
    @cook_methods = CookMethod.all
  end

  # GET /cook_methods/1 or /cook_methods/1.json
  def show
  end

  # GET /cook_methods/new
  def new
    @cook_method = CookMethod.new
  end

  # GET /cook_methods/1/edit
  def edit
  end

  # POST /cook_methods or /cook_methods.json
  def create
    @cook_method = CookMethod.new(cook_method_params)

    respond_to do |format|
      if @cook_method.save
        format.html { redirect_to cook_method_url(@cook_method), notice: "Cook method was successfully created." }
        format.json { render :show, status: :created, location: @cook_method }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cook_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cook_methods/1 or /cook_methods/1.json
  def update
    respond_to do |format|
      if @cook_method.update(cook_method_params)
        format.html { redirect_to cook_method_url(@cook_method), notice: "Cook method was successfully updated." }
        format.json { render :show, status: :ok, location: @cook_method }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cook_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cook_methods/1 or /cook_methods/1.json
  def destroy
    @cook_method.destroy

    respond_to do |format|
      format.html { redirect_to cook_methods_url, notice: "Cook method was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cook_method
      @cook_method = CookMethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cook_method_params
      params.require(:cook_method).permit(:name, :description)
    end
end
