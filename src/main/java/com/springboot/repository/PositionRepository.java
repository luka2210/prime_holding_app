package com.springboot.repository;

import org.springframework.data.repository.CrudRepository;

import com.springboot.entity.PositionEntity;

public interface PositionRepository extends CrudRepository<PositionEntity, Integer>{
	
}
