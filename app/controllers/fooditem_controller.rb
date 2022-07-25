class FooditemController < ActionController::Base
    skip_before_action :verify_authenticity_token
    def createFooditem
        name = params[:name]
        food_type = params[:food_type]
        main_ingradient = params[:main_ingradient]
        cost = params[:cost]
        img_url = params[:img_url]
        available = params[:available]
        num = "1"

        fooditem = {
            "name" => name,
            "food_type" => food_type,
            "main_ingradient" => main_ingradient,
            "cost" => cost,
            "img_url" => img_url,
            "available" => available,
            "num" => num
        }
        puts(fooditem)
        newfooditem = FoodItem.new(fooditem)

        newfooditem.save

        render :json=>newfooditem
    end

    # get specific food based on food types
    def getSpecificFoods
        # allFood = Food.all
        receive_type = params[:food_type]
        typeFoods = FoodItem.where(food_type: receive_type)
        render :json => typeFoods
    end

    # delete a food item
    def deleteFoodItem
        id = params[:id]
        food = FoodItem.delete(id)
        render :json => id
    end

end
