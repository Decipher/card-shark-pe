import Deck from 'card-deck'

export default function(context, inject) {
  const cards = []

  const suits = ['heart', 'diamond', 'club', 'spade']
  const ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  for (const suit of suits) {
    for (const rank of ranks) {
      cards.push({ rank, suit })
    }
  }

  const deck = new Deck(cards)
  inject('deck', deck)
}
