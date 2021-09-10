class ErrorResponses
  class << self
    def internal
      Response.new(500, message: "Internal Error").to_json
    end

    def forbidden
      Response.new(403, message: "Forbidden Action").to_json
    end

    def unauthorized
      Response.new(401, message: "Unauthorized").to_json
    end
  end
end
