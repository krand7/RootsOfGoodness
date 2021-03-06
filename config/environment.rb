# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Date format
my_date_formats = { :default => '%b %d, %Y' } 
Time::DATE_FORMATS.merge!(my_date_formats) 
Date::DATE_FORMATS.merge!(my_date_formats)