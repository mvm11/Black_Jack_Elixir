defmodule Game do

  def start(deck, player_name, player_hand) do

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------
    # I N T R O D U C C I Ó N

    # Mostrar intro
    Introduction.show_intro()

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------

    # J U G A D O R

    # Conocer el tañano de la lista deck
    shuffled_deck_size = Enum.count(deck)

     # Generar un rango desde 0 hasta el tamaño de la lista shuffled_deck
    range = 0..shuffled_deck_size

    # Tomar un número aleatorio del rango para el jugador
    random_card_player_hand = Enum.random(range)

    # El jugador toma la carta aleatoria
    first_player_card = Enum.at(deck, random_card_player_hand)

    # Se actualiza el mano del jugador
    cards = [] ++ first_player_card
    first_updated_player_hand = %{player_hand | cards: [cards]}

    # "Actualiza" la lista shuffled_deck
    deck_player_first_round = List.delete_at(deck, random_card_player_hand)

    # Obtiene puntaje jugador
    first_player_score = Hand.value(first_updated_player_hand)
    IO.puts("El puntaje del jugador es: #{first_player_score}")

    # R E S U M E N

    IO.puts(" ")
    IO.puts("💫 Resumen ")
    IO.puts(" ")
    IO.puts("🃏 Ronda 1 🃏")
    IO.puts(" ")
    IO.puts("El puntaje de #{player_name} es: #{first_player_score}")
    IO.puts(" ")

    if first_player_score > 21 do
      IO.puts("Te pasaste de 21 con #{first_player_score} puntos. Perdiste.")
      :perdiste
    else
      start(deck_player_first_round, player_name, player_hand)
    end
  end
end
