class Card  <  ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true

  after_validation :check_translate_text

  before_validation do
    self.review_date = Time.now + 3.days
  end

      def check_translate_text
        errors.add(:original_text, 'Check the Word')
        if self.original_text.mb_chars.upcase.to_s == self.translated_text.mb_chars.upcase.to_s
        end
     end
  end
