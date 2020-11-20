class TransactionsController < ApplicationController
  def index
    matching_transactions = Transaction.all

    @list_of_transactions = matching_transactions.order({ :created_at => :desc })

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
    the_transaction.sender_id = params.fetch("query_sender_id")
    the_transaction.recipient_id = params.fetch("query_recipient_id")
    the_transaction.steel_offered = params.fetch("query_steel_offered")
    the_transaction.clay_offered = params.fetch("query_clay_offered")
    the_transaction.grain_offered = params.fetch("query_grain_offered")
    the_transaction.steel_requested = params.fetch("query_steel_requested")
    the_transaction.clay_requested = params.fetch("query_clay_requested")
    the_transaction.grain_requested = params.fetch("query_grain_requested")
    the_transaction.status = params.fetch("query_status")
    the_transaction.greetings = params.fetch("query_greetings")

    if the_transaction.valid?
      the_transaction.save
      redirect_to("/transactions", { :notice => "Transaction created successfully." })
    else
      redirect_to("/transactions", { :notice => "Transaction failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_transaction = Transaction.where({ :id => the_id }).at(0)

    the_transaction.sender_id = params.fetch("query_sender_id")
    the_transaction.recipient_id = params.fetch("query_recipient_id")
    the_transaction.steel_offered = params.fetch("query_steel_offered")
    the_transaction.clay_offered = params.fetch("query_clay_offered")
    the_transaction.grain_offered = params.fetch("query_grain_offered")
    the_transaction.steel_requested = params.fetch("query_steel_requested")
    the_transaction.clay_requested = params.fetch("query_clay_requested")
    the_transaction.grain_requested = params.fetch("query_grain_requested")
    the_transaction.status = params.fetch("query_status")
    the_transaction.greetings = params.fetch("query_greetings")

    if the_transaction.valid?
      the_transaction.save
      redirect_to("/transactions/#{the_transaction.id}", { :notice => "Transaction updated successfully."} )
    else
      redirect_to("/transactions/#{the_transaction.id}", { :alert => "Transaction failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_transaction = Transaction.where({ :id => the_id }).at(0)

    the_transaction.destroy

    redirect_to("/transactions", { :notice => "Transaction deleted successfully."} )
  end
end
