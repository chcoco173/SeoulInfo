package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.EVApiVO;

@Mapper
public interface EVApiDAO {

	public EVApiVO findAll();

}
