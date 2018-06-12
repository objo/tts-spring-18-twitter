class AddGeneratedFlagToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :generated, :boolean
  end
end
