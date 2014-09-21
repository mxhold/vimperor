class CreateOptionSets < ActiveRecord::Migration
  def change
    create_table :option_sets do |t|
      t.boolean :compatible, null: false

      t.timestamps
    end
  end
end
