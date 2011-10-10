class Task < ActiveRecord::Base

  def perform!
    opts = {}.tap { |h| h[:body] = body if body }
    Rails.logger.info "Requesting #{http_method} #{url}..."
    response = HTTParty.send(http_method.downcase, url, opts)
    Rails.logger.info <<-INFO.strip_heredoc
      response:
        headers: #{response.headers.inspect}
        code: #{response.code}
        body: #{response.body}
    INFO
  end

end
