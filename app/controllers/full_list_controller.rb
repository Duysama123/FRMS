class FullListController < ApplicationController
  def show
    @shopping_list_items = ShoppingList.joins(:account, :recipe, :ingredient, :cook_method)
                                       .where(account_id: params[:account_id], recipe_id: params[:recipe_id])
                                       .includes(:ingredient)

    if @shopping_list_items.empty?
      flash[:alert] = "No items found in this shopping list."
    end
  end
end
