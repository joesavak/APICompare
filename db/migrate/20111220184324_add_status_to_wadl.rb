class AddStatusToWadl < ActiveRecord::Migration
  def change
    add_column :wadls, :status, :string
  end
end
