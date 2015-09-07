module Validate
  class AddUser
    include ActiveModel::Validations
    attr_accessor :username, :email, :password

    validates :username, presence: true, format: { with: /\A[a-zA-Z\s]+\z/,
                                                   message: 'only allows letters' }

    validates :email, presence: true

    validates :password, presence: true

    def initialize(params = {})
      @username      = params[:username]
      @email         = params[:email]
      @password      = params[:password]
      ActionController::Parameters.new(params).permit(username, email, password)
    end
  end

  class AddFood
    include ActiveModel::Validations
    attr_accessor :add_name

    validates :add_name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/,
                                                   message: 'only allows letters' }

    def initialize(params = {})
      @add_name      = params[:add_name].downcase
      ActionController::Parameters.new(params).permit(add_name)
    end
  end

  class FoodItem
    include ActiveModel::Validations
    attr_accessor :search, :num_results

    validates :searchQuery, presence: true, format: { with: /\A[a-zA-Z\s]+\z/,
                                                 message: 'only allows letters' }

    validates :numberOfResults, presence: true, numericality: true
    def initialize(params = {})
      @search      = params[:searchQuery].downcase
      @num_results = params[:numberOfResults].to_i if params[:results].to_i != 0
      ActionController::Parameters.new(params).permit(search, num_results)
    end
  end
end
