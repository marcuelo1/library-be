class Book < ApplicationRecord
    validates :isbn, :author, :dewey_decimal, :issn, presence: true
end
