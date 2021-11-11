module RecipesHelper
  def duration_in_words(time)
    hours, minutes = time.split(':').map(&:to_i)
    [].tap do |parts|
      parts << "#{hours} hour".pluralize(hours) unless hours.zero?
      parts << "#{minutes} minute".pluralize(minutes) unless minutes.zero?
    end.join(', ')
  end
end
