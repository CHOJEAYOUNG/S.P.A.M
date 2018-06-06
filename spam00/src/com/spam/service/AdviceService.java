package com.spam.service;

import java.util.List;

import com.spam.domain.Advice;

public interface AdviceService {
	public List<Advice> list(Advice advice);

	public void add(Advice advice);

	public Advice view(Advice advice);

	public void edit(Advice advice);

	public void delete(Advice advice);
}
