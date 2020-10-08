package com.nof.service;

import com.nof.dao.FoodlistMapper;
import com.nof.pojo.Foodlist;

import java.util.List;

public class FoodlistServiceImpl implements FoodlistService{

    private FoodlistMapper foodlistMapper;
    public void setFoodlistMapper(FoodlistMapper foodlistMapper) {
        this.foodlistMapper = foodlistMapper;
    }

    public int addFoodlist(Foodlist foodlist) {
        return foodlistMapper.addFoodlist(foodlist);
    }

    public int deleteFoodlist(int foodId) {
        return foodlistMapper.deleteFoodlist(foodId);
    }

    public int updateFoodlist(Foodlist foodlist) {
        return foodlistMapper.updateFoodlist(foodlist);
    }

    public Foodlist queryFoodlistById(int foodId) {
        return foodlistMapper.queryFoodlistById(foodId);
    }

    public List<Foodlist> queryAllFoodlist() {
        return foodlistMapper.queryAllFoodlist();
    }
}
