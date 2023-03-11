package com.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.entity.TaskEntity;
import com.springboot.repository.EmployeeRepository;
import com.springboot.repository.TaskRepository;

import jakarta.validation.Valid;

@Controller
@RequestMapping("tasks")
public class TaskController {
	@Autowired
	TaskRepository taskRepository;
	
	@Autowired 
	EmployeeRepository employeeRepository;
	
	@GetMapping("add-task")
	public String showTaskView(Model model) {
		model.addAttribute("allEmployees", employeeRepository.findAll());
		model.addAttribute("task", new TaskEntity());
		return "add-task";
	}
	
	@PostMapping("add-task") 
	public String addTask(@Valid @ModelAttribute("task") TaskEntity task, BindingResult bindingResult, Model model) {
		model.addAttribute("allEmployees", employeeRepository.findAll());
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("savedTaskSuccessful", false);
			return "add-task";
		}
		try {
			//this is terrible but it's the simplest way to get data binder to work
			if (!task.getCompleted())
				task.setCompletionDate(null);
			task.setEmployee(employeeRepository.findById(task.getEmployeeId()).orElse(null));		
			
			taskRepository.save(task);
			model.addAttribute("savedTask", task);
			model.addAttribute("savedTaskSuccessful", true);
		}
		catch (Exception e) {
			model.addAttribute("savedTaskSuccessful", false);
			var error = (DataIntegrityViolationException) e;
			model.addAttribute("errorMessage", error.getRootCause().getMessage());
		}
		return "add-task";
	}
}
