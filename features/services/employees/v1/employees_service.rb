module Dummy
  module V1
    class EmployeesService
      include HTTParty

      base_uri CONFIG_API['dummy']['employees']['host']

      def initialize
        @headers = { 'Content-Type': 'application/json' }
      end

      def create_employee(body)
        self.class.post(CONFIG_API['dummy']['employees']['create']['v1'], body: body.to_json, headers: @headers)
      end

      def delete_employee_id(id)
        self.class.delete("#{CONFIG_API['dummy']['employees']['delete']['v1']}/#{id}", headers: @headers)
      end
    end
  end
end
