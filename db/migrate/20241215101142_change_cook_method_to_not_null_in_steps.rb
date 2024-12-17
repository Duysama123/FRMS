class ChangeCookMethodToNotNullInSteps < ActiveRecord::Migration[7.0]
  def change
        change_column_null :steps, :cook_method_id, false
  end
end
