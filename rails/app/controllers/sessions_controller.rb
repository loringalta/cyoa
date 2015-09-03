require 'pp'

class SessionsController < Devise::SessionsController
  def create
    respond_to do |format|
      format.html { super }
      format.json do
        puts "why"
        self.resource = warden.authenticate!(scope: resource_name)

        puts "why"
        pp warden.authenticate!(scope: resource_name)
        sign_in(resource_name, resource)
        data = {
          user_token: self.resource.authentication_token,
          user_email: self.resource.email
        }
        render json: data, status: 201
      end
    end
  end
end
