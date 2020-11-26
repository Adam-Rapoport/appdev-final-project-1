class TransactionsController < ApplicationController
  def index
    
    incoming_transactions = Transaction.where({ :recipient_id => session[:player_id], :status => "Pending" })
    @list_incoming_transactions = incoming_transactions.order({ :created_at => :desc })

    sent_transactions = Transaction.where({ :sender_id => session[:player_id] })
    @list_sent_transactions = sent_transactions.order({ :created_at => :desc })

    @the_player = Player.where({ :id => session[:player_id] }).first
    @players = Player.where.not({ :id  => session[:player_id] }).order({:id => :asc})
    render({ :template => "transactions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_transactions = Transaction.where({ :id => the_id })

    @the_transaction = matching_transactions.at(0)

    render({ :template => "transactions/show.html.erb" })
  end

  def create
    the_transaction = Transaction.new
    the_transaction.sender_id = session[:player_id]
    the_transaction.recipient_id = params.fetch("query_recipient_id")

    the_transaction.steel_offered = params.fetch("query_steel_offered")
    if the_transaction.steel_offered == nil
    the_transaction.steel_offered = "0"
    end

    the_transaction.clay_offered = params.fetch("query_clay_offered")
    if the_transaction.clay_offered == nil
    the_transaction.clay_offered = "0"
    end

    the_transaction.grain_offered = params.fetch("query_grain_offered")
    if the_transaction.grain_offered == nil
    the_transaction.grain_offered = "0"
    end

    the_transaction.steel_requested = params.fetch("query_steel_requested")    
    if the_transaction.steel_requested == nil
    the_transaction.steel_requested = "0"
    end 
    
    the_transaction.clay_requested = params.fetch("query_clay_requested")
    if the_transaction.clay_requested == nil
    the_transaction.clay_requested = "0"
    end 

    the_transaction.grain_requested = params.fetch("query_grain_requested")
    if the_transaction.grain_requested == nil
    the_transaction.grain_requested = "0"
    end 

    the_transaction.status = "Pending"
    the_transaction.greetings = params.fetch("query_greetings")

    if the_transaction.valid?
      the_transaction.save
      redirect_to("/transactions", { :notice => "Request sent successfully!" })
    else
      redirect_to("/transactions", { :notice => "Request failed to send" })
    end
  end

  # def update
  #   the_id = params.fetch("path_id")
  #   the_transaction = Transaction.where({ :id => the_id }).at(0)

  #   the_transaction.sender_id = params.fetch("query_sender_id")
  #   the_transaction.recipient_id = params.fetch("query_recipient_id")

  #   if the_transaction.steel_offered != nil
  #   the_transaction.steel_offered = params.fetch("query_steel_offered")
  #   else the_transaction.steel_offered = "0"
  #   end

  #   if the_transaction.clay_offered != nil
  #   the_transaction.clay_offered = params.fetch("query_clay_offered")
  #   else the_transaction.clay_offered = "0"
  #   end

  #   if the_transaction.grain_offered != nil
  #   the_transaction.grain_offered = params.fetch("query_grain_offered")
  #   else the_transaction.grain_offered = "0"
  #   end

  #   if the_transaction.steel_requested != nil
  #   the_transaction.steel_requested = params.fetch("query_steel_requested")
  #   else the_transaction.steel_requested = "0"
  #   end 
    
  #   if the_transaction.clay_requested != nil
  #   the_transaction.clay_requested = params.fetch("query_clay_requested")
  #   else the_transaction.clay_requested = "0"
  #   end 

  #   if the_transaction.grain_requested != nil
  #   the_transaction.grain_requested = params.fetch("query_grain_requested")
  #   else the_transaction.grain_requested = "0"
  #   end 

  #   the_transaction.status = params.fetch("query_status")
  #   the_transaction.greetings = params.fetch("query_greetings")

  #   if the_transaction.valid?
  #     the_transaction.save
  #     redirect_to("/transactions/#{the_transaction.id}", { :notice => "Transaction updated successfully."} )
  #   else
  #     redirect_to("/transactions/#{the_transaction.id}", { :alert => "Transaction failed to update successfully." })
  #   end
  # end

  # def destroy
  #   the_id = params.fetch("path_id")
  #   the_transaction = Transaction.where({ :id => the_id }).at(0)

  #   the_transaction.destroy

  #   redirect_to("/transactions", { :notice => "Transaction deleted successfully."} )
  # end

  def cancel
    the_id = params.fetch("path_id")
    the_transaction = Transaction.where({ :id => the_id }).at(0)

    the_transaction.destroy

    redirect_to("/transactions", { :notice => "Transaction request canceled!"} )
  end

  def reject
    the_id = params.fetch("path_id")
    the_transaction = Transaction.where({ :id => the_id }).at(0)
    the_transaction.status = "Rejected"
    the_transaction.save

    redirect_to("/transactions", { :notice => "Transaction request rejected!"} )
  end

  def accept
    the_id = params.fetch("path_id")
    the_transaction = Transaction.where({ :id => the_id }).at(0)

    the_transaction.status = "Completed"
    

    # Sender new resource count
    new_steel = the_transaction.sender.steel_amount - the_transaction.steel_offered + the_transaction.steel_requested
    the_transaction.sender.update_attribute(:steel_amount, new_steel)

    new_grain = the_transaction.sender.grain_amount - the_transaction.grain_offered + the_transaction.grain_requested
    the_transaction.sender.update_attribute(:grain_amount, new_grain)

    new_clay = the_transaction.sender.clay_amount - the_transaction.clay_offered + the_transaction.clay_requested  
    the_transaction.sender.update_attribute(:clay_amount, new_clay)

    # Recipient new resource count
    new_steel = the_transaction.recipient.steel_amount + the_transaction.steel_offered - the_transaction.steel_requested
    the_transaction.recipient.update_attribute(:steel_amount, new_steel)

    new_grain = the_transaction.recipient.grain_amount + the_transaction.grain_offered - the_transaction.grain_requested
    the_transaction.recipient.update_attribute(:grain_amount, new_grain)

    new_clay = the_transaction.recipient.clay_amount + the_transaction.clay_offered - the_transaction.clay_requested  
    the_transaction.recipient.update_attribute(:clay_amount, new_clay)

    the_transaction.save
    redirect_to("/transactions", { :notice => "Transaction request accepted!"} )
  end

end
