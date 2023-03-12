package com.springboot.service;

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
		//I HATE PERSISTANCE 
		
		//I HATE PERSISTANCE
		/*var task = taskRepository.findById(taskId).orElse(null);
		var assignedEmployee = employeeRepository.findById(task.getEmployee().getId()).orElse(null);
		for (var taskIter: assignedEmployee.getTasks())
			if (taskIter.getId() == task.getId()) {
				assignedEmployee.getTasks().remove(taskIter);
				break;
			}
		employeeRepository.save(assignedEmployee);
		taskRepository.delete(task);*/
		taskRepository.deleteById(taskId);
	}
}
