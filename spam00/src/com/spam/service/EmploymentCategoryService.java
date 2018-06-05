package com.spam.service;

import java.util.List;

import com.spam.domain.EmploymentCategory;

public interface EmploymentCategoryService {
	public List<EmploymentCategory> find(EmploymentCategory category);
	
	public void add(EmploymentCategory category);

	public void edit(EmploymentCategory category);

	public EmploymentCategory view(int no);
	
	public void remove(int no);
}	
