class CreateIdeaComponents < ActiveRecord::Migration
    def change
        create_table :idea_components do |t|
            t.string :title
            t.string :description
            t.string :image
            t.string :background
            t.integer :order

            t.timestamps null: false
        end
    end
end
