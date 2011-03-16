require 'httparty'
require 'hashie'

require 'productwars/errors'
require 'productwars/product'
require 'productwars/stats'
require 'productwars/war'

module ProductWars
  class Client
    include HTTParty

    ### HTTParty Config ###
    format :json
    #######################

    def self.dispatch(method, *args, &block)
      base_uri "#{ProductWars.domain}/api/v1"
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
      info = response.parsed_response

      if info.class == Array
        a = []

        for hash in info
          a.push(new_product_wars_object(hash))
        end

        return a

      elsif info.class == Hash
        new_product_wars_object(info)
      end
    end

    def self.product_wars_type?(obj)
      if obj.class == Array
        obj = obj.first
      end

      if obj.nil?
        return nil
      end

      if obj.class == Hash
        if obj.has_key?('dp_id')
          if obj.has_key?('win_rate')
            ProductWars::Stats
          else
            ProductWars::Product
          end
        else
          ProductWars::War
        end
      end
    end

    def self.new_product_wars_object(info)
      type = product_wars_type?(info)

      if type == ProductWars::Product
        ProductWars::Product.new(info)
      elsif type == ProductWars::War
        ProductWars::War.new(info)
      elsif type == ProductWars::Stats
        ProductWars::Stats.new(info)
      else
        nil
      end
    end

  end
end
