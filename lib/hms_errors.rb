module HmsErrors
 
  module Ward
    class NoAvailableBeds < StandardError
      def message
      "This ward has no available beds"
      end
    end
  end
 
end