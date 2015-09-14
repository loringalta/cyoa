require 'pp'

class SessionsController < Devise::SessionsController
  def create
    respond_to do |format|
      format.html { super }
      format.json do
        pp "resource"
        pp resource_name
        self.resource = warden.authenticate!(scope: resource_name)
        pp warden.authenticate!(scope: resource_name)
        sign_in(resource_name, resource)
        data = {
          token: self.resource.authentication_token,
          user: UserSerializer.new(resource, root: false)
        }
        render json: data, status: 201
      end
    end
  end

end
