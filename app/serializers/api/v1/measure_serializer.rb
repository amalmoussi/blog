module Api
    module V1
      class MeasureSerializer < ActiveModel::Serializer
        attributes :temperature, :humidity
  
      end
    end
  end