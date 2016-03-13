class CreateTable < ActiveRecord::Migration
  def change
    create_table :voters  do |t|
      t.string :name
    end
  end
end
