# HTTPリクエストを処理するためのモジュール
module HttpDealer
  # デフォルトタイムアウト設定
  DEFAULT_TIMEOUT = 30.seconds

  def get_request(header, uri)
    # 引数の確認
    raise ArgumentError, "HeaderとURIが必要です" if header.nil? || uri.nil?

    begin
      response = http_client(header).get(uri)
      raise "get_requestで得たstatusが正常ではありません: #{response.status}" unless response.status.success?
      parse_json_response(response)
    rescue => e
      handle_http_error(e, "get_request")
    end
  end

  def get_status(header, uri)
    # 引数の確認
    raise ArgumentError, "HeaderとURIが必要です" if header.nil? || uri.nil?

    begin
      response = http_client(header).get(uri)
      response.status
    rescue => e
      handle_http_error(e, "get_status")
    end
  end

  def post_request(header, uri, body)
    # 引数の確認
    raise ArgumentError, "HeaderとURI, bodyが必要です" if header.nil? || uri.nil? || body.nil?

    begin
      # bodyの形式の場合分け
      response = case content_type
      when :JSON
        http_client(header).post(uri, json: body)
      when :form
        http_client(header).post(uri, form: body)
      else
        http_client(header).post(uri, body: body)
      end

      raise "post_requestで得たstatusが正常ではありません: #{response.status}" unless response.status.success?
      parse_json_response(response)
    rescue => e
      handle_http_error(e, "post_request")
    end
  end

  private

  # デフォルトタイムアウトを設定したhttp_client関数
  def http_client(header)
    HTTP[header].timeout(DEFAULT_TIMEOUT)
  end

  # responseをJSONパースする関数
  def parse_json_response(response)
    JSON.parse(response.body.to_s)
  rescue JSON::ParserError => e
    Rails.logger.error "JSONパースに失敗しました: #{e.message}"
    raise "JSONパースに失敗しました: #{e.message}"
  end

  # http_errorを扱う関数
  def handle_http_error(error, operation)
    Rails.logger.error "#{operation}に失敗しました: #{error.message}"
    raise "#{operation}に失敗しました: #{error.message}"
  end
end
