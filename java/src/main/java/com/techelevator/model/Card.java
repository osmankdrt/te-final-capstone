package com.techelevator.model;

public class Card {

    private int cardID;
    private String cardTitle;
    private String cardText;
    private String tags;

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }

    public String getCardTitle() {
        return cardTitle;
    }

    public void setCardTitle(String cardTitle) {
        this.cardTitle = cardTitle;
    }

    public String getCardText() {
        return cardText;
    }

    public void setCardText(String cardText) {
        this.cardText = cardText;
    }
}
