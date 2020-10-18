package com.nof.service;

import com.nof.dao.OrderdishMapper;
import com.nof.pojo.Orderdish;

import java.util.List;

public class OrderdishServiceImpl implements OrderdishService{

    private OrderdishMapper orderdishMapper;
    public void setOrderdishMapper(OrderdishMapper orderdishMapper) {
        this.orderdishMapper = orderdishMapper;
    }

    public int addOrderdish(Orderdish orderdish) {
        return orderdishMapper.addOrderdish(orderdish);
    }

    public int deleteOrderdish(int orderdishId) {
        return orderdishMapper.deleteOrderdish(orderdishId);
    }

    public int deleteOrderdishBydeskId(int deskId) {
        return orderdishMapper.deleteOrderdishBydeskId(deskId);
    }

    public int updateOrderdish(Orderdish orderdish) {
        return orderdishMapper.updateOrderdish(orderdish);
    }

    public Orderdish queryOrderdishById(int orderdishId) {
        return orderdishMapper.queryOrderdishById(orderdishId);
    }

    public List<Orderdish> queryAllOrderdish() {
        return orderdishMapper.queryAllOrderdish();
    }
}
