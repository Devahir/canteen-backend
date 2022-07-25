class MapperController < ApplicationController
    skip_before_action :verify_authenticity_token  

    def creatMaper
        
        map = {
            "order_id"=>params[:order_id],
            "food_item_id" => params[:food_item_id],
            "num_food_item" => params[:num_food_item]
        }

        newmap = Mapper.new(map)
        newmap.save

        render :json => newmap
    end
end
