package com.springboot.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.entity.EmployeeEntity;
import com.springboot.entity.TaskEntity;
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
	
	public void createTask(TaskEntity task) {
		if (!task.getCompleted())
			task.setCompletionDate(null);
		taskRepository.save(task);
	}
	
	public Iterable<TaskEntity> readAllTasks() {
		return taskRepository.findAll();
	}
	
	public TaskEntity readTask(Integer taskId) {
		return taskRepository.findById(taskId).orElse(null);
	}
	
	public void updateTask(TaskEntity task) {
		createTask(task);
	}
	
	public void deleteTask(Integer taskId) {
		taskRepository.deleteById(taskId);
	}
	
	public List<EmployeeEntity> getTop5EmployeesOfTheMonth() {
		var allEmployees = employeeRepository.findAll();
		
		List<EmployeeEntity> employeesList = new ArrayList<>();
		for (var employee: allEmployees)
			employeesList.add(employee);
		
		Collections.sort(employeesList);
		
		List<EmployeeEntity> topEmployees = new ArrayList<>();
		for (int i = 0; i < Math.min(employeesList.size(), 5); i++)
			topEmployees.add(employeesList.get(i));
			
		return topEmployees;
	}
}
