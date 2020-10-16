package com.nof.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Desklist {
    private int deskId;
    private String deskState;
    private String customName;
    private int bookNumber;

}
