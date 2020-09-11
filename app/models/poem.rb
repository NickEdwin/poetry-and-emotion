class Poem < ApplicationRecord
  validates_presence_of :author, :title, :line
end
