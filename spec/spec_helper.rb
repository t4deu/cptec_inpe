$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "coveralls"
Coveralls.wear!

require "cptec_inpe"

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(:color => true)]
