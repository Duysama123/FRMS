class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: %i[show edit update destroy]
 
  # GET /shopping_lists or /shopping_lists.json
  def index
    @shopping_lists = ShoppingList.all
  end

  # GET /shopping_lists/1 or /shopping_lists/1.json
  def show
    @shopping_list = ShoppingList.find(params[:id])
    # Check associations
    Rails.logger.debug(@shopping_list.inspect)
  end

  # GET /shopping_lists/new
  def new
    @shopping_list = ShoppingList.new
  end

  # GET /shopping_lists/1/edit
  def edit
  end

  # POST /shopping_lists or /shopping_lists.json
  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
  
    # Set default cook_method_id if not provided (e.g., default to ID 1)
    @shopping_list.cook_method_id ||= 1 # Or any ID you want to set as default
  
    respond_to do |format|
      if @shopping_list.save
        format.html { redirect_to shopping_list_url(@shopping_list), notice: "Item was successfully added to your shopping list." }
        format.json { render :show, status: :created, location: @shopping_list }
      else
        format.html { render :new }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /shopping_lists/1 or /shopping_lists/1.json
  def update
    respond_to do |format|
      if @shopping_list.update(shopping_list_params)
        format.html { redirect_to shopping_list_url(@shopping_list), notice: "Shopping list was successfully updated." }
        format.json { render :show, status: :ok, location: @shopping_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_lists/1 or /shopping_lists/1.json
  def destroy
    @shopping_list.destroy

    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: "Shopping list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_list_params
      params.require(:shopping_list).permit(:account_id, :recipe_id, :ingredient_id, :quantity, :unit, :purchased, :cook_method_id)
    end
end
