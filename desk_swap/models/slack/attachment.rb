Slack::Attachment = Struct.new(:title, :text, :fields, :actions, :unfurl_link, keyword_init: true) do
  def initialize(title:, text:, fields: nil, actions: nil, unfurl_link: true); super end
end