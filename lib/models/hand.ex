
import Card

defmodule Hand do
  defstruct name: "", cards: []

  def new_hand(name, cards) do
    %Hand{name: name, cards: cards}
  end

  def value(cards) do


    values = cards |> Enum.map(&card_value/1)
    aces = values |> Enum.filter(&(&1 == 1))
    non_aces = values |> Enum.reject(&(&1 == 1))
    non_ace_value = non_aces |> Enum.sum()

    if Enum.empty?(aces) do
      non_ace_value
    else
      num_aces = Enum.count(aces)
      if non_ace_value + num_aces > 10 do
        non_ace_value + num_aces
      else
        non_ace_value + num_aces + 10
      end
    end
  end

  def card_value(card) do
    case card.value do
      :ace ->
      if Hand.value([card]) <= 10 do
        11
      else
        1
      end
      :jack -> 10
      :queen -> 10
      :king -> 10
      value -> value
    end
  end
end
