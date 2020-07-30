require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    #binding.pry
    # if @sender.balance < @amount || @sender.status == "closed"
    #   @status = "rejected"
    #   return "Transaction rejected. Please check your account balance."
    #
    # elsif @status == "complete"
    #   return "Transaction was already excuted"
    # else
    #   @sender.deposit( @amount * -1)
    #   @receiver.deposit( @amount )
    #   @status = "complete"
    # end
    if @sender.balance >= @amount && valid? && @status == "pending"
         @sender.deposit( @amount * -1)
         @receiver.deposit( @amount )
         @status = "complete"

    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if @status == "complete"
        @sender.deposit( @amount )
        @receiver.deposit( @amount * -1)
        @status = "reversed"
    end
  end









end
