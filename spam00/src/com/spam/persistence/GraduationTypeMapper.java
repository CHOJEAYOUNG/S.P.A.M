package com.spam.persistence;

import java.util.List;

import com.spam.domain.GraduationType;

public interface GraduationTypeMapper {
	public List<GraduationType> list(GraduationType type);

	public void insert(GraduationType type);

	public GraduationType select(int no);

	public void update(GraduationType type);

	public void delete(int no);
}
