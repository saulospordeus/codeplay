class RenameTeachersToInstructors < ActiveRecord::Migration
  def change
    def self.up
      rename_table :teachers, :instructors
    end
  
    def self.down
      rename_table :instructors, :teachers
    end
  end
end
