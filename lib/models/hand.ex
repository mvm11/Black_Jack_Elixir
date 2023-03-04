defmodule Hand do
  defstruct score: 0, cards: []

  def new_hand(score, cards) do
    %Hand{score: score, cards: cards}
  end
end
