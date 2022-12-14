<template>
  <div class="watch">
      <div class="time">
          00:00:00
      </div>
      <div class="controls">
          <button id="start" v-bind="timer" v-on:click="startTimer">Start</button>
          <button id="stop" v-bind="timer" v-on:click="stopTimer">Stop</button>
          <button id="reset" v-bind="timer" v-on:click="resetTimer">Reset</button>
      </div>
  </div>
</template>

<script>
export default {
    name: 'stopwatch-timer',
    data(){
        return {
            timer: {
                time_el: null,
                seconds: 0,
                interval: null
            }
        }
    },
    methods: {
        updateTimer(){
            this.timer.seconds++;
            let hours = Math.floor(this.timer.seconds / 3600);
            let mins = Math.floor((this.timer.seconds - (hours * 3600)) / 60);
            let secs = this.timer.seconds % 60;
            this.timer.time_el = document.querySelector(".time");
           if(secs < 10){
               secs = '0' + secs;
           }
           if(mins < 10){
               mins = '0' + mins;
           }
           if(hours < 10){
               hours = '0' + hours;
           }

           this.timer.time_el.innerHTML = `${hours}:${mins}:${secs}`;
        },

        startTimer() {
            if(this.timer.interval){
                return
            }
            this.timer.interval = setInterval(this.updateTimer, 1000)
        },

        stopTimer() {
            clearInterval(this.timer.interval);
            this.timer.interval = null;
        },

        resetTimer() {
            this.stopTimer;
            this.timer.seconds = 0;
            this.timer.time_el.innerHTML = '00:00:00';
        }
    }

}
</script>

<style scoped>
    .time {
        font-size: 40px;
        text-align: center;
        padding: 30px 30px;
        color: white;
    }
    .controls {
        display: flex;
        justify-content: center;
    }
</style>