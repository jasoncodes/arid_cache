# "Ruby 1.9.2: marshaling round-trips Time#zone" 41e7c68d87903d0596228b6c1ae2c5d87b209280
# in Rails 3.0.0 breaks marshalling of fractional seconds.
#
# This is a monkey-patch of the fix at <https://github.com/rails/rails/pull/286>

if Time.method_defined? :subsec
  ref = Time.parse('00:00:00.5')
  raise "subsec pre-check failed" unless ref.subsec == 0.5
  time = Marshal.load(Marshal.dump(ref))
  if time.subsec != 0.5

    class Time
      class << self
        def _load(marshaled_time)
          time = _load_without_zone(marshaled_time)
          time.instance_eval do
            if zone = defined?(@_zone) && remove_instance_variable('@_zone')
              ary = to_a
              ary[0] += subsec if ary[0] == sec # the fix
              ary[-1] = zone
              utc? ? Time.utc(*ary) : Time.local(*ary)
            else
              self
            end
          end
        end
      end
    end

    time = Marshal.load(Marshal.dump(ref))
    raise "subsec post-check failed" unless time.subsec == 0.5

  end
end
