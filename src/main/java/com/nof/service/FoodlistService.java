package com.nof.service;

import com.nof.pojo.Foodlist;

import java.util.List;

public interface FoodlistService {
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
