class Response
  attr_accessor :status, :body, :message

  def initialize(status, opts = {})
    @status = status
    @body = opts['body'] || opts[:body]
    @message = opts['message'] || opts[:message]
  end

  def to_json
    {
      json: {},
      status: status
    }.tap{ |json| 
      json[:json]['body'] = body unless body.nil? 
      json[:json]['message'] = message unless message.nil?
    }
  end
end
