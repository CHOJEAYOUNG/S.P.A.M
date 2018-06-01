package com.spam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam.domain.GraduationType;
import com.spam.persistence.GraduationTypeMapper;

@Service
public class GraduationTypeServiceImpl implements GraduationTypeService {
	@Resource
	private GraduationTypeMapper graduationTypeMapper;

	@Override
	public List<GraduationType> find(GraduationType type) {
		List<GraduationType> list = this.graduationTypeMapper.list(type);
		return list;
	}

	@Override
	@Transactional
	public void add(GraduationType type) {
		this.graduationTypeMapper.insert(type);
	}

	@Override
	@Transactional
	public void edit(GraduationType type) {
		this.graduationTypeMapper.update(type);

	}

	@Override
	public GraduationType view(int no) {
		return this.graduationTypeMapper.select(no);
	}

	@Override
	@Transactional
	public void remove(int no) {
		this.graduationTypeMapper.delete(no);
	}
}