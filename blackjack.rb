#!/usr/bin/env ruby

# YOUR CODE HERE
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require 'pry'

class Blackjack

  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    play
  end

  def play
    puts "Launch Blackjack!"
    player_turn
    dealer_turn unless @player_hand.score > 21
    puts results
  end

  def player_turn
    2.times { deal_card_to("Player") }
    puts "Player score: #{@player_hand.score}"

    response = nil
    until response == 's' || @player_hand.score > 21
      response = nil
      until valid_input?(response)
        print "Hit or stand (H/S): "
        response = gets.chomp.downcase
        puts
      end

      deal_card_to("Player") if response == "h"
      puts "Player score: #{@player_hand.score}"
    end
  end

  def deal_card_to(user)
    card = @deck.draw!
    if user == "Player"
      @player_hand.add(card)
    elsif user == "Dealer"
      @dealer_hand.add(card)
    end
    puts "#{user} was dealt #{card.rank}#{card.suit}"
  end

  def valid_input?(input)
    ['h', 's'].include?(input)
  end

  def dealer_turn
    2.times { deal_card_to("Dealer") }
    puts "Dealer score: #{@dealer_hand.score}"

    until @dealer_hand.score >= 17
      deal_card_to("Dealer")
      puts "Dealer score: #{@dealer_hand.score}"
    end
  end

  def results
    if @player_hand.score > 21
      "You busted!"
    elsif @dealer_hand.score > 21
      "Dealer busted, you win!!"
    elsif @player_hand.score > @dealer_hand.score
      "Dealer stands. You win!"
    elsif @player_hand.score < @dealer_hand.score
      "Dealer stands. You lost!"
    else
      "Tie!"
    end
  end
end

Blackjack.new
