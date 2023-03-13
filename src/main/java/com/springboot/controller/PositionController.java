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

import com.springboot.entity.PositionEntity;
import com.springboot.service.RepositoryService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/positions")
public class PositionController {
	@Autowired
	RepositoryService repositoryService;
	
	@GetMapping("/")
	public String showPositionsView(Model model) {
		model.addAttribute("positions", repositoryService.readAllPositions());
		return "show-positions";
	}
	
	@PostMapping("/")
	public String delete(@RequestParam Integer positionId, Model model) {
		repositoryService.deletePosition(positionId);
		model.addAttribute("positions", repositoryService.readAllPositions());
		return "show-positions";
	}
	
	@GetMapping("/add-position")
	public String showAddPositionView(Model model) {
		model.addAttribute("position", new PositionEntity());
		return "add-position";
	}
	
	@PostMapping("/add-position")
	public String addPosition(@Valid @ModelAttribute("position") PositionEntity position, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("savedPositionSuccessful", false);
			return "add-position";
		}
		try {
			repositoryService.createPosition(position);
			model.addAttribute("savedPosition", position);
			model.addAttribute("savedPositionSuccessful", true);
		}
		catch (DataIntegrityViolationException e) {
			model.addAttribute("savedPositionSuccessful", false);
			model.addAttribute("errorMessage", e.getRootCause().getMessage());
		}
		return "add-position";
	}
	
	@GetMapping("/edit-position")
	public String showEditPositionView(@RequestParam Integer positionId, Model model) {
		model.addAttribute("position", repositoryService.readPosition(positionId));
		return "edit-position";
	}
	
	@PostMapping("/edit-position")
	public String editPosition(@Valid @ModelAttribute("position") PositionEntity position, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("editPositionSuccessful", false);
			return "edit-position";
		}
		try {
			repositoryService.createPosition(position);
			model.addAttribute("editPosition", position);
			model.addAttribute("editPositionSuccessful", true);
		}
		catch (DataIntegrityViolationException e) {
			model.addAttribute("editPositionSuccessful", false);
			model.addAttribute("errorMessage", e.getRootCause().getMessage());
		}
		return "edit-position";
	}
	
	@InitBinder
	public void preProcessInputData(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
}
