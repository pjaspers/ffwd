require_relative "last_fm/omniauth/last_fm"
module LastFm
  def self.config
    @yaml ||= YAML.load(ERB.new(File.read("config/last_fm.yml")).result)[Rails.env].with_indifferent_access
  end
end
