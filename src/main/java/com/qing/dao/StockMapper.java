package com.qing.dao;

import com.qing.pojo.Stock;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StockMapper {

    void addStock(Stock stock);

    void updateStock(Stock stock);

    List<Stock> queryAllStock(@Param("stockMsg") String msg);

    Stock queryByStockId(@Param("stockId") int id);

    Stock queryByStockName(@Param("stockName") String name);

}
