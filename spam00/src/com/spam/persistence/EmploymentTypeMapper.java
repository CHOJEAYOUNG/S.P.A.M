package com.spam.persistence;

import java.util.List;

import com.spam.domain.EmploymentType;

public interface EmploymentTypeMapper {
	public List<EmploymentType> list(EmploymentType type);

	public void insert(EmploymentType type);

	public EmploymentType select(int no);
	
	public void update(EmploymentType type);

	public void delete(int no);

}
