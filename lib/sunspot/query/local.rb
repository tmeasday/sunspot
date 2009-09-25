module Sunspot
  module Query
    # 
    # This query component generates parameters for LocalSolr geo-radial
    # searches. The LocalSolr API is fairly rigid, so the Local component
    # doesn't have any options - it just takes coordinates and a radius, and
    # generates the appropriate parameters.
    #
    class Local #:nodoc:
      def initialize(coordinates, radius)
        @coordinates, @radius = Util::Coordinates.new(coordinates), radius
      end

      def to_params
        {
          :qt => 'geo',
          :lat => @coordinates.lat,
          :long => @coordinates.lng,
          :radius => @radius
        }
      end
    end
  end
end
