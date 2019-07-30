module RegisterActivity
  class << self
    attr_accessor :configuration
  end

  def self.owner_method
    configuration.owner_method
  end

  def self.recipient_class
    configuration.recipient_class
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :owner_method, :recipient_class,
                  :recipient_attr, :table_name

    def initialize
      @owner_method = 'current_user'
      @recipient_class = 'account'
      @recipient_attr = 'account_id'
      @table_name = 'action'
    end
  end
end
