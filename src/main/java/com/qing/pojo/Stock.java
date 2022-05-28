package com.qing.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Stock {
    private int stockId;
    private String stockUnit;
    private String stockName;
    private int stockPrice;
    private int stockOut;
    private int stockLeft;
}
