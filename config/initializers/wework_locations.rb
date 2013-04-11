Rails.logger.info("Loading WeWork location information")
WEWORK_LOCATIONS = JSON.parse(File.read Rails.root.join('config', 'locations.json').to_s)
Rails.logger.info("Loaded #{WEWORK_LOCATIONS.count} locations")
