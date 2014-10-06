class AddIpAddressToOptionSets < ActiveRecord::Migration
  def change
    add_column :option_sets, :creator_ip, :inet
  end
end
