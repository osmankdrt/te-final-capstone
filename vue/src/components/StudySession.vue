<template>
   <div>
     <apexchart width="500" type="bar" :options="chartOptions" :series="fillBarsOut" ></apexchart>
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
            type: 'bar',
            stacked: true,
            id: 'vuechart-example'
          },
          xaxis: {
            categories: [1, 2, 3, 4, 5, 6, 7, 8, 9],
            label: {
              text: 'Study Sessions'
            }
            
          },
          colors: ['#5cb85c', '#d9534f']
        },
        series: [{
          name: 'Questions Correct',
          data: []
        },
        {
          name: 'Questions Incorrect',
          data: []
        }]
      }
    },
created() {
    flashCardService.listStudySessionsByUser().then((response) => {
        this.studySessions = response.data;
    }) 
    
},
computed: {
  // retrieveStudySessionIDs() {
  //   let sessionIDs = [];
  //   this.studySessions.forEach(studysession => {
  //     sessionIDs.push(studysession.studySessionID)
    
  //   })
  //   return sessionIDs
  // },
  // retrieveQuestionCorrect() {
  //   let questionsCorrect = [];
  //   this.studySessions.forEach(studysession => {
  //     questionsCorrect.push(studysession.questionCorrect)
  //     this.series[0].data.push(studysession.questionCorrect)
    
  //   })
  //   return questionsCorrect
  // },
  // retrieveQuestionIncorrect() {
  //   let questionsIncorrect = [];
  //   this.studySessions.forEach(studysession => {
  //     questionsIncorrect.push(studysession.questionIncorrect)
  //     this.series[1].data.push(studysession.questionIncorrect)
  //   })
  //   return questionsIncorrect
  // }

  fillBarsOut() {
    return [{name: 'Questions Correct', data: this.addQuestionsCorrect()}, {name: 'Questions Incorrect', data: this.addQuestionsIncorrect()}]
  },
  fillAxis() {
    return {categories: this.addSessionIds}
  }
},
  methods: {
  addSessionIds() {
    let sessionIDs = [];
    this.studySessions.forEach(studysession => {
      sessionIDs.push(studysession.studySessionID)
    })
    return sessionIDs;
  },

  addQuestionsCorrect() {
      let data = []
    this.studySessions.forEach(studysession => {
      data.push(studysession.questionCorrect)
    })
    return data;
  },
  addQuestionsIncorrect() {
      let data = []
    this.studySessions.forEach(studysession => {
      data.push(studysession.questionIncorrect)
    })
    return data;
  },
}
}
</script>

<style scoped>

</style>