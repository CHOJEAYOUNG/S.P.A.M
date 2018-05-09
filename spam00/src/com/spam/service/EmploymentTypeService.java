package com.spam.service;

import java.util.List;

import com.spam.domain.EmploymentType;

public interface EmploymentTypeService {
	public List<EmploymentType> find(EmploymentType type);
	
	public void add(EmploymentType type);

	public void edit(EmploymentType type);

	public EmploymentType view(String name);
	
	public EmploymentType viewNumber(int no);

	public List<EmploymentType> viewYear(int year);

	public void remove(int no);
}
