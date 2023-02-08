
module Api
    module V1
        class ArticlesController < ApplicationController
            def article_params
                params.require(:article).permit(:title, :body, :image, :status)
            end

            def index
                articles = Article.all  
                
                render json: {
                    data: ActiveModelSerializers::SerializableResource.new(articles, each_serializer: ArticleSerializer),
                    message: ['Article list fetched successfully'],
                    status: 200,
                    type: 'Success'
                }
            end

            def show
                article = article.find(params[:id])
                
                render json: {
                    data: ActiveModelSerializers::SerializableResource.new(article, serializer: ArticleSerializer),
                    message: ['Article profile fetched successfully'],
                    status: 200,
                    type: 'Success'
                }
            end 

            def create
                article = Article.new(article_params)
                if article.save
                  render json: article, status: :created
                else
                  render json: article.errors, status: :unprocessable_entity
                end
            end

            def update
                article = Article.find(params[:id])
                article.update(article_params)
                render json: article, serializer: Api::ArticleSerializer
            end

            def destroy
                article = Article.find(params[:id])
                article.destroy
                head :no_content
            end

            private 
            def article_params
                params.require(:article).permit(:title, :body, :status, :image)
            end
            
        end
    end
end