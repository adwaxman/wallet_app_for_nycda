class CreditCardsController < ApplicationController
  def index
  end

  def edit
    @credit_card = CreditCard.find(params[:id])
  end

  def show
    @card = CreditCard.find(params[:id])
    @authorized = CreditCardsUser.where(user_id: current_user.id).where(credit_card_id: @card.id).first
    @share = CreditCardsUser.new
  end

  def new
    @credit_card = CreditCard.new
  end

  def create
    puts "/\\" * 30
    puts current_user
    puts params
    card_number = params[:credit_card][:card_number]
    exp_month = params[:credit_card][:exp_month].to_i
    exp_year = params[:credit_card][:exp_year].to_i
    creator_id = current_user.id
    @credit_card = CreditCard.new(card_number: card_number, exp_month: exp_month, exp_year: exp_year, creator_id: creator_id)
    if @credit_card.save
      CreditCardsUser.create(credit_card_id: @credit_card.id, user_id: current_user.id)
      flash[:notice] = "Card added successfully"
      redirect_to user_path current_user
    else
      render :new
    end

  end

  def update
    @credit_card = CreditCard.find(params[:id])
    @user = User.find(@credit_card.creator_id)
    card_number = params[:credit_card][:card_number]
    exp_year = params[:credit_card][:exp_year]
    exp_month = params[:credit_card][:exp_month]
    @credit_card.update(card_number: card_number, exp_year: exp_year, exp_month: exp_month)
    redirect_to user_path(@user)
  end

  def destroy
    @credit_card = CreditCard.find(params[:id])
    @user = User.find(@credit_card.creator_id)
    if @credit_card.destroy
      flash[:notice] = "Card has been deleted."
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem."
      render :show
    end
  end


end
