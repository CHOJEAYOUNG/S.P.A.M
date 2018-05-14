package com.spam.service;

import java.util.List;

import com.spam.domain.EmploymentType;

public interface EmploymentTypeService {
	public List<EmploymentType> find(EmploymentType type, List<String> purpose);
	
	public void add(EmploymentType type);

	public void edit(EmploymentType type);

	public EmploymentType view(int no);

	public void remove(int no);
}
