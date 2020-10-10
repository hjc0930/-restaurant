package com.nof.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orderdish {
    private int orderdishId;
    private int foodId;
    private String foodName;
    private String foodClass;
    private double foodPrice;
    private int deskId;
}
