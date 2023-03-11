package com.springboot.repository;

import org.springframework.data.repository.CrudRepository;

import com.springboot.entity.EmployeeEntity;

public interface EmployeeRepository extends CrudRepository<EmployeeEntity, Integer> {
	
}
