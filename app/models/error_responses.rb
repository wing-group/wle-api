class ErrorResponses
  class << self
    def internal
      Response.new(500, message: "Internal Error").as_json
    end

    def forbidden
      Response.new(403, message: "Forbidden Action").as_json
    end

    def unauthorized
      Response.new(401, message: "Unauthorized").as_json
    end
  end
end
