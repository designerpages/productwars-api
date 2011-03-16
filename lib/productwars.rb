require 'productwars/client'

module ProductWars
  def self.method_missing(method, *args, &block)
    return super unless Client.respond_to?(method)
    Client.dispatch(method, *args, &block)
  end

  def self.respond_to?(method)
    return Client.respond_to?(method) || super
  end
end
