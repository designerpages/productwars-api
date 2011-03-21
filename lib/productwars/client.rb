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

      if args.count == 1 and args[0].class == Hash
        args[0] = parse_params(args[0])
      elsif args.count == 2 and args[1].class == Hash
        args[1] = parse_params(args[1])
      end

      response = self.send(method, *args, &block)

      self.handle(response)
    end

    ######### API Calls ###########
    def self.products(params="")
      get("/products.json#{params}")
    end

    def self.product(product_id, params="")
      get("/products/#{product_id}.json#{params}")
    end

    def self.wars_containing_product(product_id, params="")
      get("/products/#{product_id}/wars.json#{params}")
    end

    def self.all_wars(params="")
      get("/wars.json#{params}")
    end

    def self.product_stats(product_id, params="")
      get("/stats/products/#{product_id}.json#{params}")
    end

    def self.war(war_id, params="")
      get("/wars/#{war_id}.json#{params}")
    end

    def self.products_in_war(war_id, params="")
      get("/wars/#{war_id}/products.json#{params}")
    end

    def self.global_leaders(params="")
      get("/leaders.json#{params}")
    end

    def self.leaders_in_war(war_id, params="")
      get("/wars/#{war_id}/leaders.json#{params}")
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

      items = []
      sym = nil

      if info.has_key?("products")
        sym = "products"
        items = info[sym] 
      elsif info.has_key?("wars")    
        sym = "wars"
        items = info[sym] 
      end

      if items.count > 0
        a = []

        for hash in items
          a.push(new_product_wars_object(hash))
        end

        info[sym] = a

        return info
      elsif info.class == Hash
        return new_product_wars_object(info)
      end
      #if info.class == Array
      #  a = []

      #  for hash in info
      #    a.push(new_product_wars_object(hash))
      #  end

      #  return a

      #elsif info.class == Hash
      #  new_product_wars_object(info)
      #end
    end

    def self.product_wars_type?(obj)
      if obj.nil?
        return nil
      end

      if obj.class == Hash
        if obj.has_key?("dp_id")
          if obj.has_key?("win_rate")
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

    def self.parse_params(params_hash)
      if not params_hash.class == Hash
        return ""
      end
      
      param_string = "?"

      for k, v in params_hash
        param_string = param_string + "#{k.to_s}=#{v}&"
      end

      return param_string
    end
  end
end
