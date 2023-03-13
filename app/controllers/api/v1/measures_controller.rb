
module Api
    module V1
        class MeasuresController < ApiController

          before_action :set_article
    
          def index
            measures = Measure.all
            render json: measures
          end
          def show
                measure = Measure.find(params[:id])
                render json: measure, serializer: Api::V1::MeasureSerializer
            end
            def create
              article = Article.find(params[:article_id])
              measure = article.measures.new(measure_params)
              
              if measure.save
                render json: measure, status: :created
              else
                render json: measure.errors, status: :unprocessable_entity
              end
            end
            def update
                measure = Measure.find(params[:id])
                measure.update(measure_params)
              render json: measure, serializer: Api::V1::MeasureSerializer
            end
            def destroy
                measure = Measure.find(params[:id])
              ameasure.destroy
              head :no_content
            end

            def set_article
              @article = Article.find(params[:article_id])
            end
            private 
            def measure_params
                params.require(:measure).permit(:temperature, :humidity)
            end
        end
    end
end  