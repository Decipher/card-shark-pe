<template>
  <div>
    <Draggable v-model="cards" class="flex space-x-2">
      <DruxtEntity
        v-for="card of hand"
        :key="card.id"
        type="node--card"
        :uuid="card.id"
      />
    </Draggable>
  </div>
</template>

<script>
import Deck from 'card-deck'
import Draggable from 'vuedraggable'

export default {
  components: { Draggable },

  data: () => ({
    cards: [],
    deck: new Deck(),
    hand: new Deck(),
  }),

  async fetch() {
    // Get all cards from Drupal.
    const collections = await this.$druxt.getCollectionAll('node--card')
    this.cards = collections.map(({ data }) => data).flat()

    // Add cards to the deck.
    this.deck.cards(this.cards)
    this.deck.shuffle()

    this.hand = this.deck.draw(3)
  }
}
</script>
