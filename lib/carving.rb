require "carving/version"

module Carving

  # Extends any class which includes Carving.
  # Adds the class-level logger(…) customization method.
  def self.included(base)
    base.extend(Meta)
  end

  # Adds the class-level logger(…) customization method.
  module Meta
    # Customize the tags at the class level.
    def tag_logger(*tags)
    end
    # Get a new instance of a customized logger.
    def new_logger
    end
  end # Meta

  # Added as an instance method to any class which includes Carving.
  # Returns the tagged logger for this instance.
  def logger
    @carving_logger ||= Carving.new_logger
  end

  class << self

    def logger=(base_logger)
    end

    def logger
    end

  end # self

  # Wraps a base logger with tags.
  class Logger

    attr_accessor :base_logger

    def initialize(base_logger)
      self.base_logger = base_logger
    end

    ::Logger::Severity.constants.each do |sym|
      level = ::Logger::Severity.const_get(sym)
      name  = sym.to_s.downcase
      pred  = name + "?"
      define_method(name) do |message = nil, progname = nil, &block|
        # TODO resolve tags!
        if level >= base_logger.level
          message = block.call.to_s if block
          base_logger.add(level, message, progname)
        end
      end
      define_method(pred) do
        level >= base_logger.level
      end
    end

    def close
      base_logger.close
    end

  end # Logger

end # Carving
