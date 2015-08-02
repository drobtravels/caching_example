module SimpleCacheExample
  EXAMPLE_KEY_1 = 'example_key_1'
  DO_SOMETHING_KEY = 'example_key_2'

  class << self
    def set(value)
      Rails.cache.write(EXAMPLE_KEY_1, value)
    end

    def get
      Rails.cache.read(EXAMPLE_KEY_1)
    end

    def do_something
      Rails.cache.fetch(DO_SOMETHING_KEY) do
        puts 'Doing something very expensive!'
        sleep(1)
        'the answer is 33'
      end
    end
  end
end
