package com.nof.service;

import com.nof.pojo.Orderdish;

import java.util.List;

public interface OrderdishService {
    //add
    int addOrderdish(Orderdish orderdish);

    //delete
    int deleteOrderdish(int orderdishId);

    //deleteBydeskId
    int deleteOrderdishBydeskId(int deskId);

    //update
    int updateOrderdish(Orderdish orderdish);

    //search
    Orderdish queryOrderdishById(int orderdishId);

    //search *
    List<Orderdish> queryAllOrderdish();
}
