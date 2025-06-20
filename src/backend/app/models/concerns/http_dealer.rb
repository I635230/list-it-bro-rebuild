module HttpDealer
  def get_request(header, uri)
    response = HTTP[header].get(uri)
    JSON.parse(response.to_s)
  end

  def get_status(header, uri)
    response = HTTP[header].get(uri)
    response.status
  end

  def post_request(header, uri, body)
    response = HTTP[header].post(uri, form: body)
    JSON.parse(response.to_s)
  end
end
