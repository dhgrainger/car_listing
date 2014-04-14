class Changecountrytonation < ActiveRecord::Migration
  def up
    remove_column :manufacturers, :country
    add_column :manufacturers, :manufacturer_country, :string, null:false
  end

  def down
    remove_column :manufacturers, :manufacturer_country
    add_column :manufacturers, :country, :string, null:false
  end
end
