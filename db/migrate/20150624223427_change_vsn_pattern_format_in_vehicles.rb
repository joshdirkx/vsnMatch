class ChangeVsnPatternFormatInVehicles < ActiveRecord::Migration
  def change
    change_column :vehicles, :vsn_pattern, :string
  end
end
