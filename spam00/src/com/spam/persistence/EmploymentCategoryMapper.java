package com.spam.persistence;

import java.util.List;

import com.spam.domain.EmploymentCategory;

public interface EmploymentCategoryMapper {
	public List<EmploymentCategory> list(EmploymentCategory category);

	public void insert(EmploymentCategory category);

	public EmploymentCategory select(int no);
	
	public void update(EmploymentCategory category);

	public void delete(int no);
}
