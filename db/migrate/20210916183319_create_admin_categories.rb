class CreateAdminCategories < ActiveRecord::Migration
  def change
    create_table :admin_categories do |t|

      t.timestamps null: false
    end
  end
end
