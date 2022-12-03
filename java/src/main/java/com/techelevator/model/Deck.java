package com.techelevator.model;

public class Deck {

    private int deckID;
    private String deckTitle;
    private String deckDescription;

    public int getDeckID() {
        return deckID;
    }

    public void setDeckID(int deckID) {
        this.deckID = deckID;
    }

    public String getDeckTitle() {
        return deckTitle;
    }

    public void setDeckTitle(String deckTitle) {
        this.deckTitle = deckTitle;
    }

    public String getdeckDescription() {
        return deckDescription;
    }

    public void setdeckDescription(String deckDescription) {
        this.deckDescription = deckDescription;
    }
}
