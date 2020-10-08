package com.nof.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Worker {
    private int workerId;
    private int W_number;
    private String W_name;
    private String W_pwd;
    private String workerGender;
}
