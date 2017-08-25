class ConfigStore
  include Singleton
  
  def self.load(store)
    ConfigStore.instance.store.merge!(store)
  end

  def self.[](key)
    if ConfigStore.instance.store.has_key?(key)
      ConfigStore.instance.store[key]
    else
      {}
    end
  end

  attr_accessor :store

  private

  def initialize
    self.store = {}.with_indifferent_access
  end
end
