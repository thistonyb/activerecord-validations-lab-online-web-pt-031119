class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbate?


  def clickbate?
    if self.title && !self.title.match(/Won't Believe|Secret|Top [\d*]|Guess/)
      errors.add(:clickbate, "is not catchy enough!")
    end
  end
end
