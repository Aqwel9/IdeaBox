class Idea < ActiveRecord::Base
    has_many :idea_components, dependent: :destroy
    belongs_to :user
    accepts_nested_attributes_for :idea_components,
    reject_if: proc { |attributes| attributes['title'].blank? },
    allow_destroy: true

    acts_as_followable
    validates :title, presence: true
    validates :description, presence: true
    validates :user_id, presence: true

    default_scope { order(created_at: :desc) }
    scope :visible, -> { where(visibility: true) }
end
