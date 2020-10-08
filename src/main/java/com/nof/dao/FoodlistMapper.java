package com.nof.dao;

import com.nof.pojo.Foodlist;

import java.util.List;

public interface FoodlistMapper {
    //add
    int addFoodlist(Foodlist foodlist);

    //delete
    int deleteFoodlist(int foodId);

    //update
    int updateFoodlist(Foodlist foodlist);

    //search
    Foodlist queryFoodlistById(int foodId);

    //search *
    List<Foodlist> queryAllFoodlist();
}
