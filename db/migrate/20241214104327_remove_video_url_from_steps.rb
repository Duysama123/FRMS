class RemoveVideoUrlFromSteps < ActiveRecord::Migration[7.0]
  def change
    remove_column :steps, :video_url, :string
  end
end
