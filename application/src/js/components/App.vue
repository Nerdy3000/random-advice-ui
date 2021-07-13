<script>
  import axios from 'axios';

  export default {
    name: 'App',
    data: () => {
      return {
        slip: null,
      };
    },
    methods: {
      // Generate random advice from AdviceSlip and display it
      getRandomAdvice() {
        let adviceSlipApiUrl = 'https://api.adviceslip.com/advice';
        let config = {
          method: 'get',
          url: adviceSlipApiUrl,
        };
        
        axios( config )
          .then(( response ) => {
            if ( response &&
                typeof response.data === 'object' &&
                response.data &&
                typeof response.data.slip === 'object' &&
                typeof response.data.slip.advice === 'string' ) {
              this.slip = response.data.slip;
            }
          })
          .catch(( error ) => {
            console.warn( error );
          });
      }
    },
    mounted () {
      this.getRandomAdvice();
    },
  };
</script>

<template>
  <div class="advice-slip-container">
    <div v-if="slip"
        class="advice-slip">
      <p>{{ slip.advice }}</p>
      <button @click="getRandomAdvice">Another</button>
    </div>
  </div>
</template>