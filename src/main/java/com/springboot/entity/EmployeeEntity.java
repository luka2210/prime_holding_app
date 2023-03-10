package com.springboot.entity;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="employees")
public class EmployeeEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@NotNull(message="is required.")
	@Size(min=2, max=30, message="must be between 2 and 30 charachers long.")
	private String firstName;
	@NotNull(message="is required.")
	@Size(min=2, max=30, message="must be between 2 and 30 charachers long.")
	private String lastName;
	@NotNull(message="is required.")
	@Pattern(regexp="^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", message="must be of proper format (e.g. test@gmail.com)")
	private String email;
	@NotNull(message="is required.")
	@Pattern(regexp="^[\\+]?[(]?[0-9]{3}[)]?[-\\s\\.]?[0-9]{3}[-\\s\\.]?[0-9]{4,6}$", message="must be of proper format (e.g. +381-64-1122333")
	private String phoneNumber;
	@NotNull(message="is required.")
	private Date dateOfBirth;
	@NotNull(message="is required.")
	@Min(value=300, message="must be greater than 300€")
	@Max(value=10000, message="must be less than 10000€")
	private Integer monthlySalary;
	
	public EmployeeEntity() {}
	
	public EmployeeEntity(Long id, String firstName, String lastName, String email, String phoneNumber, Date dateOfBirth, Integer monthlySalary) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.dateOfBirth = dateOfBirth;
		this.monthlySalary = monthlySalary;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Integer getMonthlySalary() {
		return monthlySalary;
	}

	public void setMonthlySalary(Integer monthlySalary) {
		this.monthlySalary = monthlySalary;
	}
}
