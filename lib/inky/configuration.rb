module Inky
  # @return [Inky::Configuration] Inky's current configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Set Inky's configuration
  # @param config [Inky::Configuration]
  def self.configuration=(config)
    raise TypeError, "Not an Inky::Configuration" unless config.is_a?(Configuration)
    
    @configuration = config
  end

  # Modify Inky's current configuration
  # @yieldparam [Inky::Configuration] config current Inky config
  # ```
  # Inky.configure do |config|
  #   config.template_engine = :slim
  #   config.column_count = 24
  # end
  # ```
  def self.configure
    yield configuration
  end

  class Configuration
    attr_reader :template_engine, :column_count, :components

    def initialize
      @template_engine = :erb
      @column_count = 12
      @components = {}
    end

    def template_engine=(value)
      @template_engine = value.to_sym
    end

    def components=(value)
      raise TypeError, "components must be a Hash" unless value.is_a?(Hash)
      
      @components = value
    end

    def column_count=(value)
      raise TypeError, "column_count must be an Integer" unless value.is_a?(Integer)
      
      @column_count = value
    end
  end
end
