package com.qing.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Custom{
    private int customId;
    private String customName;
    private String customFrom;
    private String customWork;
    private String customLevel;
    private String customTel;
    private String customPhone;
    private String customCode;
    private String customAddress;
}
