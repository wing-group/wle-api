class Response
  attr_accessor :status, :body, :message

  def initialize(status, opts = {})
    @status = status
    @body = opts['body'] || opts[:body]
    @message = opts['message'] || opts[:message]
  end

  def as_json
    {
      status: @status
    }.tap{ |json| 
      json['body'] = @body unless @body.nil? 
      json['message'] = @message unless @message.nil?
    }
  end
end