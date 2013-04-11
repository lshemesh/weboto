Rails.logger.info("Loading WeWork location information")
WEWORK_LOCATIONS = YAML.load_file(Rails.root.join('config', 'locations.yml').to_s)
Rails.logger.info("Loaded #{WEWORK_LOCATIONS.count} locations")
