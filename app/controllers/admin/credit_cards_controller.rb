class Admin::CreditCardsController < ApplicationController

  before_action :verify_admin

  def index
    @cards = CreditCard.all

  end

  def create

  end

  def edit

  end

  def destroy
    puts params
    @card = CreditCard.find(params[:credit_card_id])
    if current_admin.password == params[:password]
      @card.destroy
      flash[:notice] = "Card has been deleted"
      redirect_to admin_credit_cards_path
    else
      flash[:alert] = "There was a problem"
      redirect_to admin_credit_cards_path
    end

  end

  private

  def verify_admin
    redirect_to root_path unless current_admin
  end

end
