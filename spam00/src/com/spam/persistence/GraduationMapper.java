package com.spam.persistence;

import java.util.List;

import com.spam.domain.Graduation;

public interface GraduationMapper {
	public List<Graduation> list(Graduation graduation);

	public void insert(Graduation graduation);

	public Graduation select(int grlNo);
	
	public void update(Graduation graduation);

	public void delete(int grlNo);
}
