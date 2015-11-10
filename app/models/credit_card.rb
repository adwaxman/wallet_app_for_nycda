class CreditCard < ActiveRecord::Base
  has_many :credit_cards_users, dependent: :destroy
  has_many :users, through: :credit_cards_users

  validates :card_number, uniqueness: true, presence: true
  before_save :check_type, :check_date, :check_valid_card


  def check_type
    cc = self.card_number
    if cc =~ /\A[6][0][1][1][0-9]{12}\z/
      self.card_type = "Discover"
    elsif cc =~ /\A[5][1-5][0-9]{14}\z/
      self.card_type = "Mastercard"
    elsif cc =~ /\A[4]([0-9]{12}|[0-9]{15})\z/
      self.card_type = "Visa"
    elsif cc =~ /\A[3][4|7][0-9]{13}\z/
      self.card_type = "Amex"
    else
      errors.add(:card_number, "is not a valid Discover, Visa, Mastercard, or American Express.")
      return false
    end
  end

  def check_date
    exp_month = self.exp_month.to_i
    exp_year = self.exp_year.to_i
    puts exp_year
    month_today = Date.today.strftime("%m").to_i
    year_today = Date.today.strftime("%Y").to_i
    if exp_year < year_today
        errors.add(:exp_year, "cannot be earlier than the current year.")
        return false
    elsif exp_year == year_today && exp_month < month_today
        errors.add(:exp_month, "cannot be earlier than the current month.")
        return false
    end
  end

  def check_valid_card
    
  end


end
