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
    if @sender.balance < @amount || @sender.status == "closed" || @sender.status == "complete"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.balance = @sender.balance - @amount
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end

  def reverse_transfer

  end









end
