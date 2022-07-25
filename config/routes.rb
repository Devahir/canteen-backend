Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #foodItem
  post "/createFooditem" , to:"fooditem#createFooditem"
  get "/getFoodByType", to: "fooditem#getSpecificFoods"
  delete '/foodItem/:id', to: "fooditem#deleteFoodItem"
  
  #UserProfiles
  post "/createuserprofile", to:"userprofile#createUserProfile"
  get "/authenticate", to: "userprofile#authenticate"
  put '/updateuserprofile' ,to:"userprofile#updateUserProfile"
  get '/getByUsername', to: "userprofile#getUserByUsername"

  #Orders
  post "/createOrder" , to:"order#createOrder"
  get "/getOrderByUser", to:"order#getOrderByUser"
  delete "/deleteOrder", to:"order#deleteOrder"
  put "/updateOrder", to:"order#updateOrder"
  
  #Mapper
  post "/creatMap", to:"mapper#creatMaper"
  # Defines the root path route ("/")
  # root "articles#index"
end