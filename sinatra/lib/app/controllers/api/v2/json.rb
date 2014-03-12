module API
  module V2
    class JSON < API::V1::JSON
      def key
        'string'
      end
    end
  end 
end