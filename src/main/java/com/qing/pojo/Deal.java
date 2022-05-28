package com.qing.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Deal {
    private int dealId;
    private String dealName;
    private String dealCustom;
    private String dealPeople;
    private String dealAddress;
    private String dealPhone;
    private String dealTime;
    private String dealWorker;
    private String dealStock;
    private String dealNumber;
    private String dealDetail;
    private String dealState;

    public Deal(){}

    public Deal(int dealId, String dealName, String dealCustom, String dealPeople,
                String dealAddress, String dealPhone, String dealWorker, String dealStock,
                String dealNumber, String dealDetail, String dealState) {
        this.dealId = dealId;
        this.dealName = dealName;
        this.dealCustom = dealCustom;
        this.dealPeople = dealPeople;
        this.dealAddress = dealAddress;
        this.dealPhone = dealPhone;
        this.dealTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        this.dealWorker = dealWorker;
        this.dealStock = dealStock;
        this.dealNumber = dealNumber;
        this.dealDetail = dealDetail;
        this.dealState = dealState;
    }

    public int getDealId() {
        return dealId;
    }

    public void setDealId(int dealId) {
        this.dealId = dealId;
    }

    public String getDealName() {
        return dealName;
    }

    public void setDealName(String dealName) {
        this.dealName = dealName;
    }

    public String getDealCustom() {
        return dealCustom;
    }

    public void setDealCustom(String dealCustom) {
        this.dealCustom = dealCustom;
    }

    public String getDealPeople() {
        return dealPeople;
    }

    public void setDealPeople(String dealPeople) {
        this.dealPeople = dealPeople;
    }

    public String getDealAddress() {
        return dealAddress;
    }

    public void setDealAddress(String dealAddress) {
        this.dealAddress = dealAddress;
    }

    public String getDealPhone() {
        return dealPhone;
    }

    public void setDealPhone(String dealPhone) {
        this.dealPhone = dealPhone;
    }

    public String getDealTime() {
        return dealTime;
    }

    public void setDealTime(String dealTime) {
        this.dealTime = dealTime;
    }

    public String getDealWorker() {
        return dealWorker;
    }

    public void setDealWorker(String dealWorker) {
        this.dealWorker = dealWorker;
    }

    public String getDealStock() {
        return dealStock;
    }

    public void setDealStock(String dealStock) {
        this.dealStock = dealStock;
    }

    public String getDealNumber() {
        return dealNumber;
    }

    public void setDealNumber(String dealNumber) {
        this.dealNumber = dealNumber;
    }

    public String getDealDetail() {
        return dealDetail;
    }

    public void setDealDetail(String dealDetail) {
        this.dealDetail = dealDetail;
    }

    public String getDealState() {
        return dealState;
    }

    public void setDealState(String dealState) {
        this.dealState = dealState;
    }

    @Override
    public String toString() {
        return "Deal{" +
                "dealId=" + dealId +
                ", dealName='" + dealName + '\'' +
                ", dealCustom='" + dealCustom + '\'' +
                ", dealPeople='" + dealPeople + '\'' +
                ", dealAddress='" + dealAddress + '\'' +
                ", dealPhone='" + dealPhone + '\'' +
                ", dealTime='" + dealTime + '\'' +
                ", dealWorker='" + dealWorker + '\'' +
                ", dealStock='" + dealStock + '\'' +
                ", dealNumber='" + dealNumber + '\'' +
                ", dealDetail='" + dealDetail + '\'' +
                ", dealState='" + dealState + '\'' +
                '}';
    }
}
