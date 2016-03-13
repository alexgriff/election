class FormatVotersName < ActiveRecord::Migration
  def change
    remove_column :voters, :name
    add_column :voters, :first_name, :string
    add_column :voters, :last_name, :string
  end
end
