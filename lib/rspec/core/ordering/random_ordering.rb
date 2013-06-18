module RSpec::Core::Ordering
  class RandomOrdering
    def initialize(configuration = RSpec.configuration)
      @configuration = configuration
    end

    def order(items)
      Kernel.srand @configuration.seed
      ordering = items.sort_by { Kernel.rand(items.size) }
      Kernel.srand # reset random generation
      ordering
    end

    def built_in?
      true
    end
  end
end
