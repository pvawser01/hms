module HmsErrors
 
  module Ward
    class NoAvailableBeds < StandardError
      def message
      "This ward has no available beds"
      end
    end
    
    class PatientCategoryMismatch < StandardError
      def message
        "Patient category can not be accepted on this ward."
      end
    end
  end
 
end