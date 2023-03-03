defmodule Deck do
  def suits, do: [:hearts, :diamonds, :clubs, :spades]
  def values, do: [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

  def new_card(value, suit) do
    %Card{value: value, suit: suit}
  end

  def new_deck do
    suits()
    |> Enum.flat_map(fn suit ->
      values()
      |> Enum.map(fn value ->
        new_card(value, suit)
      end)
    end)
  end


  def shuffle(deck) do
    Enum.shuffle(deck)
  end
end
