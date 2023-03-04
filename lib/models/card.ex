defmodule Card do
  defstruct value: 0, suit: :undefined

  def to_string(%Card{value: :ace, suit: :clubs}), do: "A : ♣️"
  def to_string(%Card{value: :ace, suit: :diamonds}), do: "A : ♦️"
  def to_string(%Card{value: :ace, suit: :hearts}), do: "A : ❤️"
  def to_string(%Card{value: :ace, suit: :spades}), do: "A : ♠️"

  def to_string(%Card{value: :queen, suit: :clubs}), do: "👸 : ♣️"
  def to_string(%Card{value: :queen, suit: :diamonds}), do: "👸 : ♦️"
  def to_string(%Card{value: :queen, suit: :hearts}), do: "👸 : ❤️"
  def to_string(%Card{value: :queen, suit: :spades}), do: "👸 : ♠️"

  def to_string(%Card{value: :jack, suit: :clubs}), do: "🃏 : ♣️"
  def to_string(%Card{value: :jack, suit: :diamonds}), do: "🃏 : ♦️"
  def to_string(%Card{value: :jack, suit: :hearts}), do: "🃏 : ❤️"
  def to_string(%Card{value: :jack, suit: :spades}), do: "🃏 : ♠️"

  def to_string(%Card{value: :king, suit: :clubs}), do: "🤴 : ♣️"
  def to_string(%Card{value: :king, suit: :diamonds}), do: "🤴 : ♦️"
  def to_string(%Card{value: :king, suit: :hearts}), do: "🤴 : ❤️"
  def to_string(%Card{value: :king, suit: :spades}), do: "🤴 : ♠️"

  def to_string(%Card{value: value, suit: :clubs}), do: "#{value} : ♣️"
  def to_string(%Card{value: value, suit: :diamonds}), do: "#{value} : ♦️"
  def to_string(%Card{value: value, suit: :hearts}), do: "#{value} : ❤️"
  def to_string(%Card{value: value, suit: :spades}), do: "#{value} : ♠️"
end
