package com.springboot.entity;

import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="positions")
public class PositionEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@NotNull(message="Department is required.")
	private String department;
	@NotNull(message="Seniority is required.")
	private Integer seniority;
	@OneToMany(mappedBy="position", fetch = FetchType.EAGER, orphanRemoval = true)
	private Set<EmployeeEntity> employees;
	
	public PositionEntity() {}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Integer getSeniority() {
		return seniority;
	}

	public void setSeniority(Integer seniority) {
		this.seniority = seniority;
	}

	public Set<EmployeeEntity> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<EmployeeEntity> employees) {
		this.employees = employees;
	}
	
	public String getSeniorityString() {
		switch(seniority) {
		case 0:
			return "Intern";
		case 1:
			return "Junior";
		case 2:
			return "Medior";
		case 3:
			return "Senior";
		default:
			return "error";
		}
	}
	
	public String getSeniorityAndDepartment() {
		return getSeniorityString() + " " + getDepartment();
	}
	
	public Integer getNumberOfEmployees() {
		return employees.size();
	}
	
	public Float getAverageSalary() {
		Float totalSalary = 0f;
		for (var employee: employees) 
			totalSalary += employee.getMonthlySalary();
		int div = getNumberOfEmployees();
		if (div == 0)
			return 0f;
		return totalSalary / div;
	}
	
	public String getAverageSalaryString() {
		float avgSalary = getAverageSalary();
		if (avgSalary == 0)
			return "0";
		return String.format("%,.3f", avgSalary);
	}
}
