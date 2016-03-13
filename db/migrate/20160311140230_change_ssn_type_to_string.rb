class ChangeSsnTypeToString < ActiveRecord::Migration
  def change
    change_column :voters, :ssn, :string
  end
end
