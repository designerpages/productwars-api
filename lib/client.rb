require 'httparty'

require 'errors'

module ProductWars
  class Client
    include HTTParty

    ### HTTParty Config ###
    #@base_uri = 'www.productwars.com/api/v1'
    base_uri 'localhost:3000/api/v1'
    format :json
    #######################

    def self.dispatch(method, *args, &block)
      response = self.send(method, *args, &block)
      self.handle(response)
    end

    ######### API Calls ###########
    def self.product(product_id)
      get("/products/#{product_id}.json")
    end

    def self.wars_containing_product(product_id)
      get("/products/#{product_id}/wars.json")
    end

    def self.all_wars
      get("/wars.json")
    end

    def self.product_stats(product_id)
      get("/stats/products/#{product_id}.json")
    end

    def self.war(war_id)
      get("/wars/#{war_id}.json")
    end

    def self.products_in_war(war_id)
      get("/wars/#{war_id}/products.json")
    end

    def self.global_leaders
      get("/leaders.json")
    end

    def self.leaders_in_war(war_id)
      get("/wars/#{war_id}/leaders.json")
    end
    ###############################

    def self.handle(response)
      if response.response.code.to_i == 404
        raise ProductWars::Errors::NotFound
      else
        self.wrap(response) 
      end
    end

    def self.wrap(response)
      product_wars_info = response.parsed_response

      if product_wars_info.class == Array
        a = []
        for hash in product_wars_info
          a.push(ProductWars::Response.new(hash))
        end

        return a
      elsif product_wars_info.class == Hash
        ProductWars::Response.new(product_wars_info)
      end
    end
  end
end
