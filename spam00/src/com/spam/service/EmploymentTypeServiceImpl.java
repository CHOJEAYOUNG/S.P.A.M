package com.spam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam.domain.EmploymentType;
import com.spam.persistence.EmploymentTypeMapper;

@Service
public class EmploymentTypeServiceImpl implements EmploymentTypeService {
	@Resource
	private EmploymentTypeMapper employmentTypeMapper;

	@Override
	public List<EmploymentType> find(EmploymentType type) {
		List<EmploymentType> list = this.employmentTypeMapper.list(type);
		return list;
	}
	
	@Override
	@Transactional
	public void add(EmploymentType type) {
		this.employmentTypeMapper.insert(type);
	}

	@Override
	@Transactional
	public void edit(EmploymentType type) {
		this.employmentTypeMapper.update(type);

	}

	@Override
	public EmploymentType view(int no) {
		return this.employmentTypeMapper.select(no);
	}

	@Override
	@Transactional
	public void remove(int no) {
		this.employmentTypeMapper.delete(no);
	}
}
