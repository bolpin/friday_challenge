require 'rubygems/version'

module Utils

  # returns array of minimum 3 segments (maj, minor, patch)
  # NOTE: pre-release suffixes are ignored
  def parse_version(version_str)
    segments = Gem::Version.new(version_str).release.segments
    while segments.length < 3
      segments.push 0
    end
    segments
  end

  # def birthdate_range_for(min_age, max_age=150)
  #   (max_age.years.ago.yesterday.to_date..min_age.years.ago.to_date)
  # end
  #
end

