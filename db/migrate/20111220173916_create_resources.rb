class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :wadl_id
      t.string :name
      t.string :base_url

      t.timestamps
    end
  end
end
