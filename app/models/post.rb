class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    words = ["Won't Believe", "Secret", "Top ", "Guess"]
    if !self.title.nil?
      if !words.any?{|word| self.title.include?(word)}
        self.errors.add(:clickbait?, 'Not clickbaity enough!')
      end
    end
  end

end
