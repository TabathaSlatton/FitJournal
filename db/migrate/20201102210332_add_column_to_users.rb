class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :profile_img_url, :string
    add_column :users, :starting_weight, :float
    add_column :users, :current_weight, :float
    add_column :users, :long_term_goal, :text
    add_column :users, :goal_weight, :float
  end
end
