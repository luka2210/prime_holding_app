package com.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.entity.EmployeeEntity;
import com.springboot.repository.EmployeeRepository;
import com.springboot.repository.TaskRepository;

@Service
public class RepositoryService {
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired 
	TaskRepository taskRepository;
	
	public EmployeeEntity createEmployee(EmployeeEntity employee) {
		return employeeRepository.save(employee);
	}
	
	public Iterable<EmployeeEntity> readAllEmployees() {
		return employeeRepository.findAll();
	}
	
	public EmployeeEntity readEmployee(Integer employeeId) {
		return employeeRepository.findById(employeeId).orElse(null);
	}

	public EmployeeEntity updateEmployee(EmployeeEntity employee) {
		return employeeRepository.save(employee);
	}
	
	public void deleteEmployee(Integer employeeId) {
		employeeRepository.deleteById(employeeId);
	}
}
