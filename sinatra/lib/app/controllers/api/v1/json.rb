module API
  module V1
    class JSON
      attr_reader :data
      
      def initialize(data={})
        @data = { key => data[key].upcase }
      end
      
      def key
        'str'
      end
    end
  end 
end