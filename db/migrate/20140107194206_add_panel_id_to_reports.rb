class AddPanelIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :panel_id, :integer
  end
end
