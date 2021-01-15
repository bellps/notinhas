class Note < ApplicationRecord
  belongs_to :user, optional: true
  has_rich_text :title
  has_rich_text :description
end
