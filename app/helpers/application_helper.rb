module ApplicationHelper
  class String
    def title_case
      self.split.inject([]) { |words, w|
        words << (%w(a and the).include?(w) && words.any? ? w : w.capitalize)
      }.join(' ')
    end
  end
end
