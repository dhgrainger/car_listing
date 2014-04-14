class Getridofcountry < ActiveRecord::Migration
   def up
    remove_column :manufacturers, :manufacturer_country
    add_column :manufacturers, :nation, :string, null:false
  end

  def down
    remove_column :manufacturers, :nation
    add_column :manufacturers, :manufacturer_country, :string, null:false
  end
end
