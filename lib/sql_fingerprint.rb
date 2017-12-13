require 'digest/sha1'
require 'sql_fingerprint/version'
require 'sql_fingerprint/abstract_query'

module SqlFingerprint
  module_function

  def calculate(query)
    abstract_query = abstract(query)
    Digest::SHA1.hexdigest(abstract_query)
  end

  def abstract(query)
    SqlFingerprint::AbstractQuery.build(query)
  end
end
