class AddCandidateAttributes < ActiveRecord::Migration
  def change
    remove_column :candidates, :name
    add_column :candidates, :first_name, :string
    add_column :candidates, :last_name, :string
    add_column :candidates, :birthdate, :date
    add_column :candidates, :state, :string
    add_column :candidates, :district, :integer
    add_column :candidates, :personality_type, :string
    add_column :candidates, :bio, :text
    add_column :candidates, :political_views, :text
    add_column :candidates, :national_candidate?, :boolean
    add_column :candidates, :state_candidate?, :boolean
    add_column :candidates, :local_candidate?, :boolean
    rename_column :candidates, :position, :position_running_for
    add_column :candidates, :incumbent?, :boolean
  end
end
