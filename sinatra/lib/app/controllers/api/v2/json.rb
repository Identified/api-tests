module API
  module V2
    class JSON < API::V1::JSON
      
      def initialize(data)
        super(data)
        sleep(0.05)
      end
      
      def key
        'string'
      end
    end
  end 
end