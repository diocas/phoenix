<template>
  <oc-notifications>
    <transition-group name="oc-alerts-transition" tag="div">
      <oc-notification-message
            v-for="item in $_ocMessages_limited"
            :key="item.id"
            :title="item.title"
            :message="item.desc"
            :status="item.status"
            @close="deleteMessage(item)"
            class="uk-width-large"
    />
    </transition-group>
  </oc-notifications>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  methods: {
    ...mapActions(['deleteMessage'])
  },
  computed: {
    ...mapGetters(['activeMessages']),

    $_ocMessages_limited () {
      return this.activeMessages ? this.activeMessages.slice(0, 5) : []
    }
  }
}
</script>
