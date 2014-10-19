class ChangeJsonbToJson < ActiveRecord::Migration
  def change
    remove_column :option_sets, :options, :jsonb
    add_column :option_sets, :options, :json
  end
end
