<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="8">
        <player
          v-for="(player, key) in players"
          :key="key"
          v-bind="player"
          @click.native="takeCard(key)"
        >
          <card
            v-if="player.hand.length"
            v-bind="player.hand[player.hand.length - 1]"
          />
          Score: {{ player.hand.length }}
        </player>

        Remaining: {{ $deck.remaining() }}

        <v-btn fab @click="addPlayer"><v-icon>mdi-plus</v-icon></v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Card from '~/components/Card'
import Player from '~/components/Player'

export default {
  name: 'CardSharkPE',

  components: {
    card: Card,
    player: Player
  },

  data: () => ({
    discard: [],
    players: [
      {
        name: 'Player 1',
        hand: []
      }
    ]
  }),

  created() {
    this.$deck.shuffle()
  },

  methods: {
    addPlayer() {
      this.players.push({
        name: `Player ${this.players.length + 1}`,
        hand: []
      })
    },

    takeCard(id) {
      if (this.$deck.remaining()) {
        const card = this.$deck.draw()
        this.players[id].hand.push(card)
      }
    }
  }
}
</script>
