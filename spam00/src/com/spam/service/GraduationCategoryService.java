package com.spam.service;

import java.util.List;

import com.spam.domain.GraduationCategory;

public interface GraduationCategoryService {
public List<GraduationCategory> find(GraduationCategory category);
	
	public void add(GraduationCategory category);

	public void edit(GraduationCategory category);

	public GraduationCategory view(int no);
	
	public void remove(int no);
}
