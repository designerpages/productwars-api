require 'vcr'
require 'ruby-debug'

require File.expand_path('../../lib/productwars', __FILE__)
require File.expand_path('../../lib/productwars/errors', __FILE__)

VCR.config do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.stub_with                :fakeweb
  c.default_cassette_options = { :record => :once }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end
