Slack::Response = Struct.new(:response_type, :text, :attachments, keyword_init: true) do
  def initialize(response_type: 'in_channel', text:, attachments: nil); super end
end