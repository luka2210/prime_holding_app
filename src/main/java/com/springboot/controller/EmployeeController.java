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

import com.springboot.entity.EmployeeEntity;
import com.springboot.service.RepositoryService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/employees")
public class EmployeeController {
	@Autowired
	RepositoryService repositoryService;
	
	@GetMapping("/")
	public String showEmployeesView(Model model) {
		model.addAttribute("employees", repositoryService.readAllEmployees());
		return "show-employees";
	}
	
	@PostMapping("/")
	public String delete(@RequestParam Integer employeeId, Model model) {
		repositoryService.deleteEmployee(employeeId);
		model.addAttribute("employees", repositoryService.readAllEmployees());
		return "show-employees";
	}
	
	@GetMapping("/add-employee")
	public String showAddEmployeeView(Model model) {
		model.addAttribute("employee", new EmployeeEntity());
		return "add-employee";
	}
	
	@PostMapping("/add-employee")
	public String addEmployee(@Valid @ModelAttribute("employee") EmployeeEntity employee, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("savedEmployeeSuccessful", false);
			return "add-employee";
		}
		try {
			repositoryService.createEmployee(employee);
			model.addAttribute("savedEmployee", employee);
			model.addAttribute("savedEmployeeSuccessful", true);
		}
		catch (DataIntegrityViolationException e) {
			model.addAttribute("savedEmployeeSuccessful", false);
			model.addAttribute("errorMessage", e.getRootCause().getMessage());
		}
		return "add-employee";
	}
	
	@GetMapping("edit-employee") 
	public String showEditEmployeeView(@RequestParam Integer employeeId, Model model) {
		model.addAttribute("employee", repositoryService.readEmployee(employeeId));
		return "edit-employee";
	}
	
	@PostMapping("edit-employee")
	public String editEmployee(@Valid @ModelAttribute("employee") EmployeeEntity editEmployee, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("editEmployeeSuccessful", false);
			return "edit-employee";
		}
		try {
			repositoryService.updateEmployee(editEmployee);
			model.addAttribute("editEmployee", editEmployee);
			model.addAttribute("editEmployeeSuccessful", true);
		}
		catch (DataIntegrityViolationException e) {
			model.addAttribute("editEmployeeSuccessful", false);
			model.addAttribute("errorMessage", e.getRootCause().getMessage());
		}
		return "edit-employee";
	}
	
	@InitBinder
	public void preProcessInputData(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
}
