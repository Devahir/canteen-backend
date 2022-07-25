class UserprofileController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def createUserProfile
       user = {
        "role"=> params[:role],
        "firstname"=> params[:firstname],
        "lastname"=> params[:lastname],
        "phone_no"=> params[:phone_no],
        "email"=> params[:email],
        "img_url"=> params[:img_url],
        "username"=> params[:username],
        "password"=> params[:password],
        "auth_token"=> params[:auth_token]  
         }

         newUSerProfile = UserProfile.new(user)
         newUSerProfile.save

         render :json => newUSerProfile;
    end

    def authenticate
        username = params[:username]
        password = params[:password]
        user = UserProfile.find_by(username: username)
        if(user == nil)
            render :json=>{"err":"UserName didn't exist"}
        elsif(user.password != password)
            render :json=>{"err":"Password Error"}
        else
            render :json=>user
        end
    end

    def updateUserProfile
        role = params[:role]
        firstname = params[:firstname]
        lastname = params[:lastname]
        phone_no = params[:phone_no]
        email = params[:email]
        img_url = params[:img_url]
        username = params[:username]
        password = params[:password]
        user = UserProfile.find_by(username: username)
        user.firstname = firstname
        user.lastname = lastname
        user.phone_no = phone_no
        user.email = email
        user.img_url = img_url
        user.password = password
        user.role = role
        user.save
        # UserProfile.update(:all,"role: role ,firstname: firstname,lastname: lastname,phone_no: phone_no,email: email,img_url: img_url password: password")
        render :json=>user
    end

    def getUserByUsername
        username1 = params[:username]
        user = UserProfile.find_by(username: username1)
        render :json=>user
    end
end
