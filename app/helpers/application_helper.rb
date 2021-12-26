module ApplicationHelper
  # Takes in a Date/Time object and returns a formatted date. Ex. June 10th, 2020 13:15
  #
  # @param date [ActiveSupport::TimeWithZone] the data to format
  # @return [String] the formatted date
  def format_date(date)
    date.to_s(:long_ordinal)
  end
end
