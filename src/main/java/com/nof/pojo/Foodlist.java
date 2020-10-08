package com.nof.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Foodlist {
    private int foodId;
    private String foodName;
    private String foodClass;
    private double foodPrice;
}
