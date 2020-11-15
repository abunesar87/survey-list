<template>
  <div class="home">
    <StartView />
  </div>
</template>

<script>
// @ is an alias to /src
import StartView from '@/components/StartView.vue'

export default {
  name: 'Home',
  components: {
    StartView
  }
}
</script>

<style lang="scss">

.home {
  position: relative;
}
</style>

