package com.spam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spam.domain.Employment;
import com.spam.persistence.EmploymentMapper;

@Service
public class EmploymentServiceImpl implements EmploymentService {
	@Resource
	private EmploymentMapper employmentMapper;

	@Override
	public List<Employment> find(int id) {
		return this.employmentMapper.list(id);
	}

	@Override
	public void add(Employment employment) {
		this.employmentMapper.insert(employment);
	}

	@Override
	public void edit(Employment employment) {
		this.employmentMapper.update(employment);
	}

	@Override
	public Employment view(int emplNo) {
		return this.employmentMapper.select(emplNo);
	}
	
	@Override
	public Employment viewID(int id) {
		return this.employmentMapper.selectID(id);
	}

	@Override
	public void remove(int emplNo) {
		this.employmentMapper.delete(emplNo);
	}
}