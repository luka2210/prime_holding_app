package com.springboot.repository;

import org.springframework.data.repository.CrudRepository;

import com.springboot.entity.TaskEntity;

public interface TaskRepository extends CrudRepository<TaskEntity, Integer>{

}
