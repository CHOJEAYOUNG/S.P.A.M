package com.spam.persistence;

import java.util.List;

import com.spam.domain.GraduationCategory;

public interface GraduationCategoryMapper {
	public List<GraduationCategory> list();

	public void insert(GraduationCategory category);

	public GraduationCategory select(int no);

	public void update(GraduationCategory category);

	public void delete(int no);
}