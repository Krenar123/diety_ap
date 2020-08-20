class Article < ApplicationRecord
    MAX_TITLE_LENGTH = 120
    MAX_BODY_LENGTH = 2200

    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
    validates :body, length: { maximum: MAX_BODY_LENGTH }
end
