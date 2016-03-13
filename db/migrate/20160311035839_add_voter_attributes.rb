class AddVoterAttributes < ActiveRecord::Migration
  def change
    add_column :voters, :ssn, :integer
    add_column :voters, :birthdate, :date
    add_column :voters, :email, :string
    add_column :voters, :address, :string
    add_column :voters, :state, :string
    add_column :voters, :district, :integer
    add_column :voters, :registration_status, :boolean
  end
end
