class AddIdeaRefToIdeaComponents < ActiveRecord::Migration
  def change
    add_reference :idea_components, :idea, index: true, foreign_key: true
  end
end
