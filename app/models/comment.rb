class Comment < ApplicationRecord
    include Visible
    has_one_attached :user

    belongs_to :article
  end
  