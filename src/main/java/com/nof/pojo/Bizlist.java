package com.nof.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bizlist {
    private int bizlistId;
    private int deskId;
    private String customName;
    private Double sal;
}
