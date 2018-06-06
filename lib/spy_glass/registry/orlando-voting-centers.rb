require 'spy_glass/registry'

time_zone = ActiveSupport::TimeZone["Eastern Time (US & Canada)"]

opts = {
  path: '/orlando-voting-centers',
  cache: SpyGlass::Cache::Memory.new(expires_in: 3600),
  source: 'https://localhost:8000/voting'
}

SpyGlass::Registry << SpyGlass::Client::JSON.new(opts) do |body|
  # For each election
    # Generate most recent notification if within one day
    # Create map of all precincts
