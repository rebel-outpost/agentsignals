# Load the rails application
require File.expand_path('../application', __FILE__)
require 'gibberish'

::KEY = Gibberish::AES.new("awerwrREWdfER1645")
# Initialize the rails application
AgentSignals::Application.initialize!

