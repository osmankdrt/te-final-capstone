package com.techelevator.model;

public class StudySession {
    private int studySessionID;
    private int userID;
    private int questionCorrect;
    private int questionIncorrect;
    private int total;


    public int getStudySessionID() {
        return studySessionID;
    }

    public void setStudySessionID(int studySessionID) {
        this.studySessionID = studySessionID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getQuestionCorrect() {
        return questionCorrect;
    }

    public void setQuestionCorrect(int questionCorrect) {
        this.questionCorrect = questionCorrect;
    }

    public int getQuestionIncorrect() {
        return questionIncorrect;
    }

    public void setQuestionIncorrect(int questionIncorrect) {
        this.questionIncorrect = questionIncorrect;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
