class MoveOptionsToHstore < ActiveRecord::Migration
  def up
    enable_extension :hstore
    add_column :option_sets, :options, :hstore
    remove_column :option_sets, :compatible
  end

  def down
    add_column :option_sets, :compatible, null: false
    remove_column :option_sets, :options
    disable_extension :hstore
  end
end
