package com.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.entity.EmployeeEntity;
import com.springboot.repository.EmployeeRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/employees")
public class EmployeeController {
	@Autowired
	EmployeeRepository employeeRepository;
	
	@InitBinder
	public void preProcessInputData(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	@GetMapping("/add-employee")
	public String addEmployeeView(HttpServletRequest request, Model model) {
		model.addAttribute("employee", new EmployeeEntity());
		return "add-employee";
	}
	
	@PostMapping("/add-employee")
	public String addEmployee(@Valid @ModelAttribute("employee") EmployeeEntity employee, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("savedEmployeeSuccessful", false);
			return "add-employee";
		}
		employeeRepository.save(employee);
		model.addAttribute("savedEmployee", employee);
		model.addAttribute("savedEmployeeSuccessful", true);
		return "add-employee";
	}
}
