package com.qing.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Inform {
    private int informId;
    private String informTitle;
    private String informDetail;
    private String informTime;

    public Inform(){}

    public Inform(int informId, String informTitle, String informDetail) {
        this.informId = informId;
        this.informTitle = informTitle;
        this.informDetail = informDetail;
        this.informTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }

    public int getInformId() {
        return informId;
    }

    public void setInformId(int informId) {
        this.informId = informId;
    }

    public String getInformTitle() {
        return informTitle;
    }

    public void setInformTitle(String informTitle) {
        this.informTitle = informTitle;
    }

    public String getInformDetail() {
        return informDetail;
    }

    public void setInformDetail(String informDetail) {
        this.informDetail = informDetail;
    }

    public String getInformTime() {
        return informTime;
    }

    public void setInformTime(String informTime) {
        this.informTime = informTime;
    }

    @Override
    public String toString() {
        return "Inform{" +
                "informId=" + informId +
                ", informTitle='" + informTitle + '\'' +
                ", informDetail='" + informDetail + '\'' +
                ", informTime='" + informTime + '\'' +
                '}';
    }
}
