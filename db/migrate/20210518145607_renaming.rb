class Renaming < ActiveRecord::Migration[6.1]
  def change
    rename_table :teachers, :instructors
  end
end
