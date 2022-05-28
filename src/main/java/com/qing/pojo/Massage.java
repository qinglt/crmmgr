package com.qing.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Massage {
    private int msgId;
    private String msgWorker;
    private String msgDetail;
    private String msgTime;

    public  Massage(){}

    public Massage(int msgId, String msgWorker, String msgDetail) {
        this.msgId = msgId;
        this.msgWorker = msgWorker;
        this.msgDetail = msgDetail;
        this.msgTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }

    public int getMsgId() {
        return msgId;
    }

    public void setMsgId(int msgId) {
        this.msgId = msgId;
    }

    public String getMsgWorker() {
        return msgWorker;
    }

    public void setMsgWorker(String msgWorker) {
        this.msgWorker = msgWorker;
    }

    public String getMsgDetail() {
        return msgDetail;
    }

    public void setMsgDetail(String msgDetail) {
        this.msgDetail = msgDetail;
    }

    public String getMsgTime() {
        return msgTime;
    }

    public void setMsgTime(String msgTime) {
        this.msgTime = msgTime;
    }

    @Override
    public String toString() {
        return "Massage{" +
                "msgId=" + msgId +
                ", msgWorker='" + msgWorker + '\'' +
                ", msgDetail='" + msgDetail + '\'' +
                ", msgTime='" + msgTime + '\'' +
                '}';
    }
}
