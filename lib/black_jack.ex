defmodule BlackJack do
  def init() do

  # ___________________________________________________________________________________

  # S E T U P   J U E G O

  # Crea una Baraja francesa desordenada
  deck = Deck.new_deck() |> Deck.shuffle()

  # _________________________________________________________________________________

  # S E T U P   J U G A D O R

  # El jugador toma la carta aleatoria
  first_player_card = Enum.random(deck)

  # Toma el valor crudo de la primer carta del jugador
  raw_player_value = first_player_card.value

  # Trata el valor crudo
  player_value = validate_first_score(raw_player_value)

  # crea la mano del jugador
  player_hand = Hand.new_hand(player_value, [] ++ first_player_card)

  # "Actualiza" la lista deck
  n_deck = List.delete(deck, first_player_card)

  # _________________________________________________________________________________

  # S E T U P   C P U


  # La CPU toma la carta aleatoria
  first_cpu_card = Enum.random(n_deck)

  # Toma el valor crudo de la primer carta de la CPU
  raw_cpu_value = first_cpu_card.value

  # Trata el valor crudo
  cpu_value = validate_first_score(raw_cpu_value)

  # crea la mano de la CPU
  cpu_hand = Hand.new_hand(cpu_value, [] ++ first_cpu_card)

  # "Actualiza" la lista deck
  new_deck = List.delete(n_deck, first_cpu_card)


  # ___________________________________________________________________________________

  # R E S U M E N   P R I M E R A   R O N D A

  IO.puts("  ")
  IO.puts("🃏 B L A C K   J A C K 🃏")
  IO.puts("  ")
  IO.puts("-----------------------------------------------------")
  IO.puts("  ")
  # Muestra resumen jugador
  IO.puts("Jugador 🦊")
  IO.puts(" ")
  first_formatted_player_cards = Card.to_string(player_hand.cards)
  IO.puts("La carta del jugador es: #{first_formatted_player_cards}")
  IO.puts(" ")
  IO.puts("el puntaje del jugador es: #{player_hand.score}")

  IO.puts("  ")
  IO.puts("-----------------------------------------------------")
  IO.puts("  ")

  # Muestra resumen cpu
  IO.puts("C P U 🤖")
  IO.puts(" ")
  first_formatted_cpu_cards = Card.to_string(cpu_hand.cards)
  IO.puts("La carta de la CPU es: #{first_formatted_cpu_cards}")
  IO.puts(" ")
  IO.puts("el puntaje de la cpu es: #{cpu_hand.score}")
  IO.puts("  ")
  IO.puts("-----------------------------------------------------")
  IO.puts("  ")

  # ___________________________________________________________________________________

  # P R E G U N T A

  ask_for_option(new_deck, player_hand, cpu_hand)

  end

  def ask_player_name() do
    # Solicita el nombre del jugador
    IO.gets("Por favor, introduce tu nombre: ") |> String.trim
  end

  def validate_first_score(value) do
    case value do
      :jack -> 10
      :queen -> 10
      :king ->10
      :ace -> 11
      _ -> value
    end
  end

  def ask_for_option(deck, player_hand, cpu_hand) do
    input = IO.gets("¿Desea tomar una nueva carta? (s/n): ") |> String.trim() |> String.upcase()
    IO.puts(" ")
    case input do
      "S" -> hit(deck, player_hand, cpu_hand)
      "N" -> endGame(player_hand, cpu_hand)
      _ ->
        IO.puts("La opción ingresada no es válida.")
        IO.puts(" ")
        ask_for_option(deck, player_hand, cpu_hand)
    end
  end

  def endGame(player_hand, cpu_hand) do
    cond do
      player_hand.score > 21 ->
        IO.puts("Perdiste")
        :lose
        cpu_hand.score > 21 ->
        IO.puts("Ganaste")
        :win
        player_hand.score === 21 ->
        IO.puts("Ganaste")
        :win
        player_hand.score < cpu_hand.score ->
        IO.puts("Perdiste")
        :lose
        player_hand.score > cpu_hand.score ->
        IO.puts("Ganaste")
        :win
        player_hand.score === cpu_hand.score ->
        IO.puts("Empate")
        :tie
      true ->
        IO.puts("what")
        :error
    end
  end

  def validate_score(score, card_score) when score >= 10 do
    cond do
      card_score === :jack  ->
        10
        card_score === :queen ->
        10
        card_score === :king ->
        10
        card_score === :ace ->
        1
        card_score -> card_score
      true ->
        IO.puts("what")
        :error
    end
  end

  def validate_score(score, card_score) when score <= 10 do
    cond do
      card_score === :jack  ->
        10
        card_score === :queen ->
        10
        card_score === :king ->
        10
        card_score === :ace ->
        11
        card_score -> card_score
      true ->
        IO.puts("what")
        :error
    end
  end

  def get_random_player_card(deck) do
    player_card = Enum.random(deck)
    player_card
  end

  def get_player_raw_value(player_card) do
     # Toma el valor crudo de la carta del jugador
     raw_player_value = player_card.value
     raw_player_value
  end

  def get_player_total_value(player_hand, player_value) do
    # Valor total del jugador
    player_total_value = player_hand.score + player_value
    player_total_value
  end

  def get_new_player_hand(player_total_value, new_player_cards) do
   # "Actualiza" la mano del jugador
   Hand.new_hand(player_total_value, new_player_cards)
  end


  def get_summary_player(new_player_hand) do
    # R E S U M E N   R O N D A   J U G A D O R
    IO.puts("  ")
    IO.puts("🃏 B L A C K   J A C K 🃏")
    IO.puts("  ")
    IO.puts("-----------------------------------------------------")
    IO.puts("  ")
    # Muestra resumen jugador
    IO.puts("Jugador 🦊")
    IO.puts(" ")
    IO.puts("las cartas del jugador son: ")
    IO.puts(" ")
    formatted_player_cards = new_player_hand.cards |> Enum.map(&Card.to_string/1)
    Enum.each(formatted_player_cards, &IO.puts/1)
    IO.puts(" ")
    IO.puts("el puntaje del jugador es: #{new_player_hand.score}")
    IO.puts("  ")
    IO.puts("-----------------------------------------------------")
    IO.puts("  ")
  end

  def get_cpu_summary(new_cpu_hand) do
    # Muestra resumen jugador
    IO.puts("  ")
    IO.puts("C P U 🤖")
    IO.puts(" ")
    IO.puts("las cartas de la cpu son: ")
    IO.puts(" ")
    formatted_cpu_cards = new_cpu_hand.cards |> Enum.map(&Card.to_string/1)
    Enum.each(formatted_cpu_cards, &IO.puts/1)
    IO.puts(" ")
    IO.puts("el puntaje de la cpu es: #{new_cpu_hand.score}")
    IO.puts("  ")
    IO.puts("-----------------------------------------------------")
    IO.puts("  ")
  end

  def hit(deck, player_hand, cpu_hand) do

  # _________________________________________________________________________________

  #  J U G A D O R

    # El jugador toma la carta aleatoria
    player_card = get_random_player_card(deck)

    # Toma el valor crudo de la carta del jugador
    raw_player_value = get_player_raw_value(player_card)

    # Trata el valor crudo
    player_value = validate_score(player_hand.score, raw_player_value)

    # Valor total del jugador
    player_total_value = get_player_total_value(player_hand, player_value)

    #Actualizar cartas del jugaor
    n_player_cards = [player_card] ++ [player_hand.cards]
    new_player_cards = List.flatten(n_player_cards)

    # "Actualiza" la mano del jugador
    new_player_hand = get_new_player_hand(player_total_value, new_player_cards)

    # R E S U M E N   R O N D A   J U G A D O R
    get_summary_player(new_player_hand)


    # "Actualiza" la lista deck
    n_deck = List.delete(deck, player_card)

    # _________________________________________________________________________________

    # C P U

    # La CPU toma la carta aleatoria
    cpu_card = Enum.random(n_deck)

    # Toma el valor crudo de la carta de la CPU
    raw_cpu_value = cpu_card.value

    # Trata el valor crudo
    cpu_value = validate_score(cpu_hand.score, raw_cpu_value)

    # Valor total de la cpu
    cpu_total_value = cpu_hand.score + cpu_value

    #Actualizar cartas de la CPU
    n_cpu_cards = [cpu_card] ++ [cpu_hand.cards]
    new_cpu_cards = List.flatten(n_cpu_cards)

    # "Actualiza" la mano de la CPU
    new_cpu_hand = Hand.new_hand(cpu_total_value, new_cpu_cards)

    get_cpu_summary(new_cpu_hand)

    # "Actualiza" la lista deck
    new_deck = List.delete(n_deck, cpu_card)

    validate_round(new_deck, new_player_hand, new_cpu_hand)

  end

  def validate_round(n_deck, new_player_hand, new_cpu_hand) do
    cond do
      new_cpu_hand.score > 21 ->
        IO.puts("Ganaste debido a que la CPU tiene un puntaje mayor a 21")
        :win
      new_player_hand.score === 21 ->
        IO.puts("Ganaste debido a que tu puntaje es 21")
        :win
      new_player_hand.score === 21 and new_cpu_hand.score === 21 ->
        IO.puts("Empate debido a que el puntaje del jugador 21 y el de la cpu también")
        :tie
      new_player_hand.score > 21 ->
        IO.puts("Perdiste porque tu puntaje supera 21")
        :lose
      new_cpu_hand.score === 21 ->
        IO.puts("Perdiste porque el puntaje de la cpu es 21")
        :lose
      true ->
        ask_for_option(n_deck, new_player_hand, new_cpu_hand)
    end
  end

end
