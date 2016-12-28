require 'pry'


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait_check

  def clickbait_check
    final = []
    clickbait = ["won't believe", "secret", "top", "guess"]
    clickbait.each do |term|
      if title != nil
        if title.downcase.include? (term)
          final << term
        end
      end
    # binding.pry
    if final.length == 0
      errors.add(:title, "not clickbait")
    end
  end

end
end
