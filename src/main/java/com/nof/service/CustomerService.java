package com.nof.service;

import com.nof.pojo.Customer;

import java.util.List;

public interface CustomerService {
    //add
    int addCustomer(Customer customer);

    //delete
    int deleteCustomer(int custId);

    //deleteByName
    int deleteCustomerByName(String custiomName);

    //update
    int updateCustomer(Customer customer);

    //search
    Customer queryCustomerById(int custId);

    //search *
    List<Customer> queryAllCustomer();
}
