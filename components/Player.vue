<template>
  <v-card outlined>
    <v-card-text>
      {{ name }}
      <slot />
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  name: 'Player',

  props: {
    name: {
      type: String,
      required: true
    }
  }
}
</script>
