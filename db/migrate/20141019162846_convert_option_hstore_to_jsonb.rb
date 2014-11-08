class ConvertOptionHstoreToJsonb < ActiveRecord::Migration
  def change
    remove_column :option_sets, :options, :hstore
    # add_column :option_sets, :options, :jsonb
    add_column :option_sets, :options, :json
    disable_extension :hstore
  end
end
