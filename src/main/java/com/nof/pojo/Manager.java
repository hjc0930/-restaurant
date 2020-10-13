package com.nof.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Manager {
    private int managerId;
    private String E_number;
    private String E_name;
    private String E_pwd;
}
