package com.spam.persistence;

import java.util.List;

import com.spam.domain.Advice;

public interface AdviceMapper {
	public List<Advice> list(Advice advice);

	public void insert(Advice advice);

	public Advice select(Advice advice);

	public void update(Advice advice);
	
	public void delete(Advice advice);
	
}
