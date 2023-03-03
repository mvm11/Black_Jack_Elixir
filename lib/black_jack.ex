defmodule BlackJack do
  def init() do

  # Crea una Baraja francesa desordenada
  deck = Deck.new_deck() |> Deck.shuffle()

  # Le pide el nombre al jugador
  player_name = ask_player_name()

   # Conocer el tañano de la lista deck
   deck_size = Enum.count(deck)

   # Generar un rango desde 0 hasta el tamaño de la lista deck
  range = 0..deck_size

  # Tomar un número aleatorio del rango para el jugador
  random_card_player_hand = Enum.random(range)

   # El jugador toma la carta aleatoria
   first_player_card = Enum.at(deck, random_card_player_hand)

  # crea la mano del jugador
  player_hand = Hand.new_hand(player_name, [] ++ first_player_card)

  Introduction.show_intro
  # Muestra las cartas del jugador
  IO.puts("La cartas de #{player_name} son: ")
  IO.inspect player_hand.cards

  # Le pregunta al jugador si desea tomar una nueva carta
  ask_for_option(deck, player_hand)

  end

  def ask_player_name() do
    # Solicita el nombre del jugador
    IO.gets("Por favor, introduce tu nombre: ") |> String.trim
  end

  def ask_for_option(deck, player_hand) do
    input = IO.gets("¿Desea tomar una nueva carta? (s/n): ") |> String.trim() |> String.upcase()
    IO.puts(" ")
    case input do
      "S" -> hit(deck, player_hand)
      "N" -> validateWhen(player_hand)
      _ ->
        IO.puts("La opción ingresada no es válida.")
        IO.puts(" ")
        ask_for_option(deck, player_hand)
    end
  end

  def hit(deck, player_hand) do

    # "Actualiza" la lista deck
    new_deck = List.delete(deck, player_hand)

    deck_size = Enum.count(new_deck)

    # Generar un rango desde 0 hasta el tamaño de la lista deck
    range = 0..deck_size

    # Tomar un número aleatorio del rango para el jugador
    random_card_player_hand = Enum.random(range)

    # El jugador toma la carta aleatoria
    player_card = Enum.at(deck, random_card_player_hand)

    updated_player_hand = Hand.new_hand(player_hand.name, [player_hand.cards]++[player_card])

    Introduction.show_intro
    # Muestra las cartas del jugador
    IO.puts("La cartas de #{player_hand.name} son: ")
    IO.puts("")
    flatten_cards = List.flatten(updated_player_hand.cards)
    IO.inspect flatten_cards

    #Conocer el puntaje del jugador
    #IO.puts("El puntaje del jugador es: #{player_score}")

    #Concer puntuación
    player_score = Hand.value(flatten_cards)
    IO.puts("El puntaje de #{player_hand.name} es: #{player_score}")
    IO.puts("")
    valite(player_score, deck, player_card, updated_player_hand)



  end

  def validateWhen(player_hand) do
    IO.puts("Mano cuando se dice que no")
    IO.inspect player_hand.cards

    #Conocer si el jugador tiene una carta o varias
    space = Kernel.is_list(player_hand.cards)

    # Conocer el puntaje segun la cantidad de cartas
    size = size(space, player_hand.cards)
    IO.puts("El puntaje es")
    IO.inspect size

    cond do
      size > 21 ->
        IO.puts("You lose!")
        :lose
        size === 21 ->
        IO.puts("You win!")
        :win
        size < 21 ->
        IO.puts("Tu puntaje es: #{size}")
        :none
      true ->
        IO.puts("what")
        :error
    end

  end

  def size(space, cards) do
    cond do
      space !== true ->
        Hand.card_value(cards)
        space === true ->
          Hand.value(cards)
      true ->
        IO.puts("what")
        :error
    end
  end

  def valite(player_score, deck, player_card, updated_player_hand) do
    cond do
      player_score > 21 ->
        IO.puts("You lose!")
        :lose
        player_score === 21 ->
        IO.puts("You win!")
        :win
        player_score < 21 ->
        IO.puts("Otra vez")
        ask_for_option(List.delete(deck, player_card), updated_player_hand)
      true ->
        IO.puts("what")
        :error
    end
  end



end
