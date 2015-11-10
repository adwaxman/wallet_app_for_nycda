class CreditCardsUsersController < ApplicationController

  def new

  end

  def create
    puts "^" * 30
    puts params
    @card = CreditCard.find(params[:credit_cards_user][:credit_card_id])
    @creator = User.find(@card.creator_id)
    @added_user = User.find_by(email: params[:credit_cards_user][:user_id])
    puts @added_user.inspect
    puts @creator.inspect
    if @added_user && @creator == current_user
        @new_share = CreditCardsUser.new(credit_card_id: @card.id, user_id: @added_user.id)
        if @new_share.save
          flash[:notice] = "User has been authorized to use this card."
          redirect_to credit_card_path(@card)
        else
          flash[:alert] = "There was a problem"
          redirect_to credit_card_path(@card)
        end
    else
      flash[:alert] = "There was a problem"
      redirect_to credit_card_path(@card)
    end
  end

  def destroy
    @join = CreditCardsUser.find(params[:id])
    @card = CreditCard.find(@join.credit_card_id)
    @creator = User.find(@card.creator_id)
    if @creator == current_user
      @join.destroy
      flash[:notice] = "User has been deauthorized"
      redirect_to credit_card_path(@card)
    else
      flash[:alert] = "There was a problem"
      redirect_to credit_card_path(@card)
    end
  end


end
