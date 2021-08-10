<template>
  <div class="border-2 rounded-xl p-2 h-35 w-25 text-center">
    <h2>{{ model.attributes.title }}</h2>
  </div>
</template>

<script>
import { DruxtEntityMixin } from 'druxt-entity'

export default {
  mixins: [DruxtEntityMixin],
}
</script>
