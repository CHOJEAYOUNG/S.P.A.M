package com.spam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spam.domain.EmploymentType;
import com.spam.persistence.EmploymentTypeMapper;

@Service
public class EmploymentTypeServiceImpl implements EmploymentTypeService {
	@Resource
	private EmploymentTypeMapper employmentTypeMapper;

	@Override
	public List<EmploymentType> find(EmploymentType type) {
		return this.employmentTypeMapper.list(type);
	}
	
	@Override
	public void add(EmploymentType type) {
		this.employmentTypeMapper.insert(type);
	}

	@Override
	public void edit(EmploymentType type) {
		this.employmentTypeMapper.update(type);

	}

	@Override
	public EmploymentType view(String name) {
		return this.employmentTypeMapper.select(name);
	}

	@Override
	public EmploymentType viewNumber(int no) {
		return this.employmentTypeMapper.selectNumber(no);
	}
	
	@Override
	public List<EmploymentType> viewYear(int year) {
		return this.employmentTypeMapper.selectYear(year);
	}
	
	@Override
	public void remove(int no) {
		this.employmentTypeMapper.delete(no);
	}
}
