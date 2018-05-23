package com.spam.service;

import java.util.List;

import com.spam.domain.GraduationType;

public interface GraduationTypeService {
	public List<GraduationType> find(GraduationType type, List<String> purpose);

	public void add(GraduationType type);

	public void edit(GraduationType type);

	public GraduationType view(int no);

	public void remove(int no);
}
