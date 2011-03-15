require 'httparty'
require 'hashie'

require 'client'
require 'errors'
require 'response'

module ProductWars
  def self.method_missing(method, *args, &block)
    return super unless Client.respond_to?(method)
    Client.dispatch(method, *args, &block)
  end

  def self.respond_to?(method)
    return Client.respond_to?(method) || super
  end
end
#@leaders = ProductWars::API.leaders(war_id)
#
#[ProductWars::Leaders]
#
#@leaders.first.rank
#
#@response = ProductWars.get_leaders(war_id)



