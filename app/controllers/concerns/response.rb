module Response
  def json_response(object, status = :ok)
    render json: success(object), status: status
  end

  def json_error(message, status = :internal_server_error)
    render json: error(message), status: status
  end

  private

  def success(object)
    {
      status: 'success',
      data: object.as_json
    }
  end

  def error(message)
    {
      status: 'error',
      data: {
        message: message
      }
    }
  end
end

