<template>
   <div>
     <apexchart width="500" type="bar" :options="chartOptions" :series="series" ></apexchart>
     <div><button>Update</button></div>
   </div>
</template>

<script>
import flashCardService from "../services/FlashCardService.js";

export default {
    data: function() {
      return {
        studySessions: [],
        chartOptions: {
          chart: {
            id: 'vuechart-example'
          },
          xaxis: {
            categories: []
          }
        },
        series: [{
          name: 'Questions Correct',
          data: [1, 2, 3]
        },
        {
          name: 'Questions Incorrect',
          data: []
        }]
      }
    },
created() {
    flashCardService.listStudySessionsByUser().then((response) => {
        this.studySessions = response.data
    })
    this.studySessions.forEach()
},
computed: {
  retrieveStudySessionIDs() {
    let sessionIDs = [];
    this.studySessions.forEach(studysession => {
      sessionIDs.push(studysession.studySessionID)
    
    })
    return sessionIDs
  },
  retrieveQuestionCorrect() {
    let questionsCorrect = [];
    this.studySessions.forEach(studysession => {
      questionsCorrect.push(studysession.questionCorrect)
      this.series[0].data.push(studysession.questionCorrect)
    
    })
    return questionsCorrect
  },
  retrieveQuestionIncorrect() {
    let questionsIncorrect = [];
    this.studySessions.forEach(studysession => {
      questionsIncorrect.push(studysession.questionIncorrect)
      this.series[1].data.push(studysession.questionIncorrect)
    })
    return questionsIncorrect
  }
},
  methods: {
    updateChart() {
   
     
      
    },
    addQuestionsCorrect() {
    this.questionsCorrect.forEach((element) => {
      this.series[0].data.push(element)
      this.$router.go()
    })
  
  }
}
}
</script>

<style scoped>

</style>