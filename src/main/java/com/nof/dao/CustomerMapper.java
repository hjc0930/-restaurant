package com.nof.dao;

import com.nof.pojo.Customer;

import java.util.List;

public interface CustomerMapper {
    //add
    int addCustomer(Customer customer);

    //delete
    int deleteCustomer(int custId);

    //deleteByName
    int deleteCustomerByName(String customName);

    //update
    int updateCustomer(Customer customer);

    //search
    Customer queryCustomerById(int custId);

    //search *
    List<Customer> queryAllCustomer();
}
