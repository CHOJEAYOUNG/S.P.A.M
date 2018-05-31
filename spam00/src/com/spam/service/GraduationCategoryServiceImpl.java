package com.spam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam.domain.GraduationCategory;
import com.spam.persistence.GraduationCategoryMapper;

@Service
public class GraduationCategoryServiceImpl implements GraduationCategoryService {
	@Resource
	private GraduationCategoryMapper graduationCategoryMapper;

	@Override
	public List<GraduationCategory> find(GraduationCategory category) {
		List<GraduationCategory> list = this.graduationCategoryMapper.list(category);
		return list;
	}

	@Override
	@Transactional
	public void add(GraduationCategory category) {
		this.graduationCategoryMapper.insert(category);
	}

	@Override
	@Transactional
	public void edit(GraduationCategory category) {
		this.graduationCategoryMapper.update(category);
	}

	@Override
	public GraduationCategory view(int no) {
		return this.graduationCategoryMapper.select(no);
	}

	@Override
	@Transactional
	public void remove(int no) {
		this.graduationCategoryMapper.delete(no);
	}
}