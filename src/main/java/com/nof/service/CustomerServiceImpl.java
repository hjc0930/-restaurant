package com.nof.service;

import com.nof.dao.CustomerMapper;
import com.nof.pojo.Customer;

import java.util.List;

public class CustomerServiceImpl implements CustomerService{

    private CustomerMapper customerMapper;
    public void setCustomerMapper(CustomerMapper customerMapper) {
        this.customerMapper = customerMapper;
    }

    public int addCustomer(Customer customer) {
        return customerMapper.addCustomer(customer);
    }

    public int deleteCustomer(int custId) {
        return customerMapper.deleteCustomer(custId);
    }

    public int updateCustomer(Customer customer) {
        return customerMapper.updateCustomer(customer);
    }

    public Customer queryCustomerById(int custId) {
        return customerMapper.queryCustomerById(custId);
    }

    public List<Customer> queryAllCustomer() {
        return customerMapper.queryAllCustomer();
    }
}
