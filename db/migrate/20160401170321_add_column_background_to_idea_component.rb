class AddColumnBackgroundToIdeaComponent < ActiveRecord::Migration
  def change
      add_column :ideas, :background, :string
  end
end
