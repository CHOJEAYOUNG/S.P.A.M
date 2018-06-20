package com.spam.persistence;

import java.util.List;

import com.spam.domain.Employment;

public interface EmploymentMapper {
	public List<Employment> list(Employment employment);

	public void insert(Employment employment);

	public Employment select(int emplNo);
	
	public void update(Employment employment);

	public void delete(int emplNo);
}
