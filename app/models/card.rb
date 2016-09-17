class Card  <  ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true

  after_validation :check_translate_text

  scope :review_date_expired, -> { where('review_date <= ?', Date.current) }
  scope :random_card, -> { limit(1).order('RANDOM()').first }

  before_create :set_review_date

  def set_review_date
    self.review_date = Time.now + 3.days
  end

  def words_are_equal?(first_word, second_word)
    first_word.casecmp(second_word).zero?
  end

  def check_translate_text
    if self.original_text.mb_chars.upcase.to_s == self.translated_text.mb_chars.upcase.to_s
      errors.add(:original_text, 'Check the Word')
    end
  end
end
