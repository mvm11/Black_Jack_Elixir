

defmodule BlackJack do


  def start do

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------

    # I N T R O D U C C I Ó N

    # Mostrar intro
    Introduction.show_intro()

    # Crea una Baraja francesa
    deck = Deck.new_deck()

    # Crea una Baraja francesa desordenada
    shuffled_deck = Deck.shuffle(deck)

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------

    # P R I M E R A   R O N D A

    # Solicita el nombre del jugador
    player_name = IO.gets("Por favor, introduce tu nombre: ") |> String.trim
    IO.puts(" ")
    IO.puts("El nombre del jugador es #{player_name}")

    # J U G A D O R

    player_hand = Hand.new_hand(player_name, [])

    # Conocer el tañano de la lista shuffled_deck
    shuffled_deck_size = Enum.count(shuffled_deck)
    IO.puts("El tamaño de la lista es #{shuffled_deck_size}")

     # Generar un rango desde 0 hasta el tamaño de la lista shuffled_deck
    range = 0..shuffled_deck_size

    # Tomar un número aleatorio del rango para el jugador
    random_card_player_hand = Enum.random(range)

    # El jugador toma la carta aleatoria
    first_player_card = Enum.at(shuffled_deck, random_card_player_hand)
    IO.puts("La carta que tomo el jugador fue: ")
    IO.inspect first_player_card

    # Se actualiza el mano del jugador
    first_updated_player_hand = %{player_hand | cards: [first_player_card]}
    IO.puts("La mano actualizada del jugador #{player_name} es: ")
    IO.inspect first_updated_player_hand

    # "Actualiza" la lista shuffled_deck
    deck_player_first_round = List.delete_at(shuffled_deck, random_card_player_hand)
    IO.puts("La baraja actualizada es: ")
    IO.inspect deck_player_first_round

    # Obtiene puntaje jugador
    first_player_score = Hand.value(first_updated_player_hand)

    # C P U

    cpu_hand = Hand.new_hand("CPU", [])

    # Conocer el tañano de la lista deck_player_first_round
    shuffled_deck_player_first_round_size = Enum.count(deck_player_first_round)
    IO.puts("El tamaño de la lista después de que el jugador #{player_name} tomara la carta es #{shuffled_deck_player_first_round_size}")

    # Generar un rango desde 0 hasta el tamaño de la lista shuffled_deck_player_first_round_size
    second_range = 0..shuffled_deck_player_first_round_size

    # Tomar un número aleatorio del rango para el jugador
    random_cpu_player_hand = Enum.random(second_range)

    # la CPU toma la carta aleatoria
    first_cpu_card = Enum.at(deck_player_first_round, random_cpu_player_hand)
    IO.puts("La carta que tomo la CPU fue: ")
    IO.inspect first_cpu_card

    # Se actualiza el mano de la CPU
    first_updated_cpu_hand = %{cpu_hand | cards: [first_cpu_card]}
    IO.puts("La mano actualizada de la cpu es: ")
    IO.inspect first_updated_cpu_hand

    # "Actualiza" la lista deck_player_first_round
    deck_cpu_first_round = List.delete_at(deck_player_first_round, random_cpu_player_hand)
    IO.puts("La baraja actualizada es: ")
    IO.inspect deck_cpu_first_round

    # Obtiene puntaje de la CPU
    first_cpu_score = Hand.value(first_updated_cpu_hand)

    IO.puts(" ")
    IO.puts("💫 Resumen ")
    IO.puts(" ")
    IO.puts("🃏 Ronda1")
    IO.puts(" ")
    IO.puts("CPU: ")
    IO.inspect first_updated_cpu_hand
    IO.puts(" ")
    IO.puts("El puntaje de la CPU es: #{first_cpu_score}")
    IO.puts(" ")
    IO.puts("#{player_name}: ")
    IO.puts(" ")
    IO.puts("El puntaje de la #{player_name} es: #{first_player_score}")
    IO.puts(" ")
    IO.inspect first_updated_player_hand








  end
end
