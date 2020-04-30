<template>
  <v-card>
    <v-card-text>{{ rank }} of {{ suit }}</v-card-text>
  </v-card>
</template>

<script>
export default {
  name: 'Card',

  props: {
    rank: {
      type: [Number, String],
      required: true
    },

    suit: {
      type: String,
      required: true
    }
  }
}
</script>
