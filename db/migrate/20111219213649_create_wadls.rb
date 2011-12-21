class CreateWadls < ActiveRecord::Migration
  def change
    create_table :wadls do |t|
      t.string :name
      t.string :wadlfile_file_name
      t.string :wadlfile_content_type
      t.integer :wadlfile_file_size
      t.timestamps
    end
  end
end
