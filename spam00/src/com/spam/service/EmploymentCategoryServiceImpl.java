package com.spam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam.domain.EmploymentCategory;
import com.spam.persistence.EmploymentCategoryMapper;

@Service
public class EmploymentCategoryServiceImpl implements EmploymentCategoryService {
	@Resource
	private EmploymentCategoryMapper employmentCategoryMapper;

	@Override
	public List<EmploymentCategory> find(EmploymentCategory category) {
		List<EmploymentCategory> listEmploymentCategory = this.employmentCategoryMapper.list(category);
		return listEmploymentCategory;
	}

	@Override
	@Transactional
	public void add(EmploymentCategory category) {
		this.employmentCategoryMapper.insert(category);
	}

	@Override
	@Transactional
	public void edit(EmploymentCategory category) {
		this.employmentCategoryMapper.update(category);
	}

	@Override
	public EmploymentCategory view(int no) {
		return this.employmentCategoryMapper.select(no);
	}

	@Override
	@Transactional
	public void remove(int no) {
		this.employmentCategoryMapper.delete(no);
	}

}
