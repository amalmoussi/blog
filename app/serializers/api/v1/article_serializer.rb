module Api
  module V1
    class ArticleSerializer < ActiveModel::Serializer
      attributes :title, :body, :image, :status

    end
  end
end