class Magazine < ApplicationRecord
    validates :volume, :author, :issue, presence: true
end
