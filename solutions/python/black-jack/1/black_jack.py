"""Functions to help play and score a game of blackjack.

How to play blackjack:    https://bicyclecards.com/how-to-play/blackjack/
"Standard" playing cards: https://en.wikipedia.org/wiki/Standard_52-card_deck
"""
def card_vale(card: str) -> int:
    if card in ("J", "Q", "K"):
        return 10
    elif card == "A":
        return 1
    return int(card)

def card_vales(card: str) -> int:
    if card in ("J", "Q", "K"):
        return 10
    elif card == "A":
        return 11
    return int(card)

def value_of_card(card):
    """Determine the scoring value of a card.

    :param card: str - given card.
    :return: int - value of a given card.  See below for values.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 1
    3.  '2' - '10' = numerical value.
    """

    if card in ["J", "K", "Q"]:
        return 10
    elif card == "A":
        return 1
    return int(card)


def higher_card(card_one, card_two):
    """Determine which card has a higher value in the hand.

    :param card_one, card_two: str - cards dealt in hand.  See below for values.
    :return: str or tuple - resulting Tuple contains both cards if they are of equal value.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 1
    3.  '2' - '10' = numerical value.
    """

    v1, v2 = card_vale(card_one), card_vale(card_two)

    if v1 > v2:
        return card_one
    elif v2 > v1:
        return card_two
    return (card_one, card_two)


def value_of_ace(card_one, card_two):
    """Calculate the most advantageous value for the ace card.

    :param card_one, card_two: str - card dealt. See below for values.
    :return: int - either 1 or 11 value of the upcoming ace card.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 11 (if already in hand)
    3.  '2' - '10' = numerical value.
    """

    if card_one == "A" or card_two == "A":
        return 1

    v1, v2 = card_vale(card_one) , card_vale(card_two)
    card_sum = v1 + v2

    if card_sum + 11 <= 21:
        return 11
    return 1
        

def is_blackjack(card_one, card_two):
    """Determine if the hand is a 'natural' or 'blackjack'.

    :param card_one, card_two: str - card dealt. See below for values.
    :return: bool - is the hand is a blackjack (two cards worth 21).

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 11 (if already in hand)
    3.  '2' - '10' = numerical value.
    """

    v1, v2 = card_vales(card_one), card_vales(card_two)
    card_sum = v1 + v2

    if card_sum == 21:
        return True
    return False


def can_split_pairs(card_one, card_two):
    """Determine if a player can split their hand into two hands.

    :param card_one, card_two: str - cards dealt.
    :return: bool - can the hand be split into two pairs? (i.e. cards are of the same value).
    """

    v1, v2 = card_vale(card_one), card_vale(card_two)

    if v1 == v2:
        return True
    return False


def can_double_down(card_one, card_two):
    """Determine if a blackjack player can place a double down bet.

    :param card_one, card_two: str - first and second cards in hand.
    :return: bool - can the hand can be doubled down? (i.e. totals 9, 10 or 11 points).
    """
    def card_vale(card):
        if card in ("J", "Q", "K"):
            return [10]
        elif card == "A":
            return [1, 11]
        
        return [int(card)]

    v1_option, v2_option = card_vale(card_one), card_vale(card_two)

    for v1 in v1_option:
        for v2 in v2_option:
            if v1 + v2 in (9, 10, 11):
                return True
    return False