<template>
  <div>
    <h1>{{studySessions}}</h1>
  </div>
</template>

<script>
import flashCardService from "../services/FlashCardService.js";

export default {
    data(){
     return {
         studySessions: [],
    }
},
created() {
    flashCardService.listStudySessionsByUser().then((response) => {
        this.studySessions = response.data
    })
}
}
</script>

<style>

</style>