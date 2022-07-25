class OrderController < ApplicationController
    skip_before_action :verify_authenticity_token   
    def createOrder
        items = params[:items].split(",")
        order = {
            "user_id"=> params[:user_id],
            "shopkeeper_id": params[:shopkeeper_id],
            "t_cost"=> params[:t_cost],
            "status"=> "1"
        }
        # 1 is order in process
        # 2 is order prepared
        # 3 is order delivered

        newOrder = Order.new(order)
        newOrder.save  
        mapList = Array.new() 
        for item_i in items
            map = {
                "order_id"=>newOrder.id,
                "food_item_id" => item_i.split("-") [0],
                "num_food_item" => item_i.split("-") [1],
            }
            newmap = Mapper.new(map)
            newmap.save
            mapList.push(newmap)
        end

        render :json => {"order"=>newOrder,"mapList"=>mapList}
    end

    def upadateOrder
        new_status = params[:status]
        order_id = params[:order_id]

        begin
        order = Order.find(order_id)
        order.update!(status: new_status)
        rescue Exception
            render :json => Exception
        end
        render :json => [order_id, new_status]
    end

    def deleteOrder
        order = Order.delete(params[:id])
        render :json => { :status => 200}
    end 

    def getOrderByUser

        diffUSer = Set.new()
        allOrder = Order.all

        for order in allOrder
            diffUSer.add(order.user_id)
        end
        arr = diffUSer.to_a
        res = Array.new()

        # Get the order items
        # maps = Mapper.where(order: order)
        
        for id in arr
           user = UserProfile.find(id)
           
           orders = (Order.where(user_id: id).where(status: "1"))

           puts(orders)
           for order in orders
               items = Array.new()
               ms = Mapper.where(order_id: order.id)
               for e in ms
                #    items.push({
                #     "item" => FoodItem.find(item.food_item_id.to_i),
                #     "num_food_item" => item.num_food_item
                #    })
                    item =FoodItem.find(e.food_item_id.to_i)
                    items.push({
                        "id"=>item.id,
                        "item_name": item.name,
                        "item_cost": item.cost,
                        "quantity": e.num_food_item
                    })
                   
                end
                res.push(
                    {"user_name"=>user["firstname"]+user["lastname"],
                        "user_ph"=>user["phone_no"],
                        "items"=>items,
                        "totol_cost"=>order.t_cost,
                        "order_id"=>order.id,
                        "status"=>order.status
                   }) 
            end 
            
        end
        # orderID = params[:user_id]
        # result = {orders:Order.where(user_id: orderID)}

    render :json=>res
    end 
    
    
        
end
