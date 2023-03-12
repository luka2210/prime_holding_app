package com.springboot.entity;

import java.sql.Date;
import java.util.Set;

//import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="employees")
public class EmployeeEntity implements Comparable<EmployeeEntity>{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@NotNull(message="First name is required.")
	@Size(max=30, message="First name can't be longer than 30 characters.")
	private String firstName;
	@NotNull(message="Last name is required.")
	@Size(max=30, message="Last name can't be longer than 30 characters.")
	private String lastName;
	@Column(unique=true)
	@NotNull(message="E-mail is required.")
	@Pattern(regexp="^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", 
		message="E-mail must be of proper format (e.g. test@gmail.com).")
	private String email;
	@Column(unique=true)
	@NotNull(message="Phone number is required.")
	@Pattern(regexp="^[\\+]?[(]?[0-9]{3}[)]?[-\\s\\.]?[0-9]{3}[-\\s\\.]?[0-9]{4,6}$", 
		message="Phone number must be of proper format (e.g. +381-64-1122333).")
	private String phoneNumber;
	@NotNull(message="Date of birth is required.")
	private Date dateOfBirth;
	@NotNull(message="Monthly salary is required.")
	@Min(value=300, message="Monthly salary must be greater than 300€.")
	@Max(value=10000, message="Monthly salary must be less than 10000€.")
	private Integer monthlySalary;
	@OneToMany(mappedBy="employee", fetch = FetchType.EAGER, orphanRemoval=true)
	private Set<TaskEntity> tasks;
	@ManyToOne
	@NotNull(message="Position is required.")
	@JoinColumn(name="positions_id")
	private PositionEntity position;
	
	public EmployeeEntity() {}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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
	
	public Set<TaskEntity> getTasks() {
		return tasks;
	}

	public void setTasks(Set<TaskEntity> tasks) {
		this.tasks = tasks;
	}

	public String getFullName() {
		return firstName + " " + lastName;
	}
	
	public String getFullNameAndId() {
		return firstName + " " + lastName + " #ID:" + id;
	}
	
	public PositionEntity getPosition() {
		return position;
	}

	public void setPosition(PositionEntity position) {
		this.position = position;
	}
	
	public int getCompletedTasks() {
		int completedTasks = 0;
		for (var task: tasks) 
			if (task.getCompletedThisMonth())
				completedTasks++;
		return completedTasks;
	}
	
	public int getCompletedTasksOnTime() {
		int completedTasksOnTime = 0;
		for (var task: tasks)
			if (task.getCompletedOnTime() && task.getCompletedThisMonth())
				completedTasksOnTime++;
		return completedTasksOnTime;
	}
	
	public float getScore() {
		return getCompletedTasks() + getCompletedTasksOnTime() / 2.0f;
	}

	@Override
	public int compareTo(EmployeeEntity o) {
		if (this.getScore() < o.getScore())
			return 1;
		if (this.getScore() > o.getScore())
			return -1;
		return 0;
	}
}
