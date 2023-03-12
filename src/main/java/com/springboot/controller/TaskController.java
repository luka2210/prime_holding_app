package com.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.entity.TaskEntity;
import com.springboot.service.RepositoryService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("tasks")
public class TaskController {
	@Autowired
	RepositoryService repositoryService;
	
	@GetMapping("/")
	public String showTasksView(Model model) {
		model.addAttribute("tasks", repositoryService.readAllTasks());
		return "show-tasks";
	}
	
	@PostMapping("/")
	public String delete(@RequestParam Integer taskId, Model model) {
		repositoryService.deleteTask(taskId);
		model.addAttribute("tasks", repositoryService.readAllTasks());
		return "show-tasks";
	}
	
	@GetMapping("add-task")
	public String showAddTaskView(Model model) {
		model.addAttribute("task", new TaskEntity());
		model.addAttribute("allEmployees", repositoryService.readAllEmployees());
		return "add-task";
	}
	
	@PostMapping("add-task") 
	public String addTask(@Valid @ModelAttribute("task") TaskEntity task, BindingResult bindingResult, Model model) {
		model.addAttribute("allEmployees", repositoryService.readAllEmployees());
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("savedTaskSuccessful", false);
			return "add-task";
		}
		try {
			repositoryService.createTask(task);
			model.addAttribute("savedTask", task);
			model.addAttribute("savedTaskSuccessful", true);
		}
		catch (DataIntegrityViolationException e) {
			model.addAttribute("savedTaskSuccessful", false);
			model.addAttribute("errorMessage", e.getRootCause().getMessage());
		}
		
		return "add-task";
	}
	
	@GetMapping("edit-task")
	public String showEditTaskView(@RequestParam Integer taskId, Model model) {
		model.addAttribute("task", repositoryService.readTask(taskId));
		model.addAttribute("allEmployees", repositoryService.readAllEmployees());
		return "edit-task";
	}
	
	@PostMapping("edit-task")
	public String showEditTaskView(@Valid @ModelAttribute("task") TaskEntity task, BindingResult bindingResult, Model model) {
		model.addAttribute("allEmployees", repositoryService.readAllEmployees());
		if (bindingResult.hasErrors()) {
			model.addAttribute("editTaskSuccessful", false);
			return "edit-task";
		}
		try {
			repositoryService.updateTask(task);
			model.addAttribute("editTask", task);
			model.addAttribute("editTaskSuccessful", true);
		}
		catch (DataIntegrityViolationException e) {
			model.addAttribute("editTaskSuccessful", false);
			model.addAttribute("errorMessage", e.getRootCause().getMessage());
		}
		
		return "edit-task";
	}
	
	@InitBinder
	public void preProcessInputData(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
}
