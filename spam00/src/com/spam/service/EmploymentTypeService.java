package com.spam.service;

import java.util.List;

import com.spam.domain.EmploymentType;

public interface EmploymentTypeService {
	public List<EmploymentType> find(EmploymentType type);
	
	public void add(EmploymentType type);

	public void edit(EmploymentType type);

	public EmploymentType view(int empNo);

	public void remove(int emplNo);
}
