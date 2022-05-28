package com.qing.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Worker {
    private int workerId;
    private String workerName;
    private String workerPwd;
    private String workerPost;
    private String workerPhone;
    private String workerAddress;
    private String workerHand;
}
