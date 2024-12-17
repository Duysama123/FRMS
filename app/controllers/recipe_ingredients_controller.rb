class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: %i[show edit update destroy ]


  # GET /recipe_ingredients or /recipe_ingredients.json
  def index
    @recipe_ingredients = RecipeIngredient.all
  end

  # GET /recipe_ingredients/1 or /recipe_ingredients/1.json
  def show
  end

  # GET /recipe_ingredients/new
  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  # GET /recipe_ingredients/1/edit
  def edit
  end

  # POST /recipe_ingredients or /recipe_ingredients.json
  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    
    # Adjust unit based on quantity
    if @recipe_ingredient.quantity == 1
      @recipe_ingredient.unit = @recipe_ingredient.unit.singularize
    else
      @recipe_ingredient.unit = @recipe_ingredient.unit.pluralize
    end

    respond_to do |format|
      if @recipe_ingredient.save
        format.html { redirect_to recipe_ingredient_path(@recipe_ingredient), notice: "Recipe Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @recipe_ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_ingredients/1 or /recipe_ingredients/1.json
  def update
    # Adjust unit based on the updated quantity
    if recipe_ingredient_params[:quantity].to_f == 1
      @recipe_ingredient.unit = @recipe_ingredient.unit.singularize
    else
      @recipe_ingredient.unit = @recipe_ingredient.unit.pluralize
    end
    respond_to do |format|
      if @recipe_ingredient.update(recipe_ingredient_params)
        format.html { redirect_to recipe_ingredient_url(@recipe_ingredient), notice: "Recipe ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredients/1 or /recipe_ingredients/1.json
  def destroy
    @recipe_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to recipe_ingredients_url, notice: "Recipe ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /recipes/:recipe_id/show_ingredients
  def show_ingredients
    # Tìm recipe dựa trên params[:recipe_id], trả về error nếu không tìm thấy
    @recipe = Recipe.find_by(id: params[:recipe_id]) 
    if @recipe
      @recipe_ingredients = @recipe.recipe_ingredients.includes(:ingredient, :cook_method, image_attachment: :blob)
    else
      redirect_to recipes_path, alert: "Recipe not found"
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :quantity, :unit, :image, :optional, :cook_method_id)
  end
end
