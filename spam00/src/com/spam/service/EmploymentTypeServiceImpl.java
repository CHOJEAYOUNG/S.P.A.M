package com.spam.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spam.domain.EmploymentCategory;
import com.spam.domain.EmploymentType;
import com.spam.persistence.EmploymentCategoryMapper;
import com.spam.persistence.EmploymentTypeMapper;

@Service
public class EmploymentTypeServiceImpl implements EmploymentTypeService {
	@Resource
	private EmploymentTypeMapper employmentTypeMapper;
	@Resource
	private EmploymentCategoryMapper employmentCategoryMapper;
	

	@Override
	public List<EmploymentType> find(EmploymentType type, List<String> purpose) {
		List<EmploymentType> list = new ArrayList<EmploymentType>();
		List<EmploymentType> listY = new ArrayList<EmploymentType>();
		int count = 0;
		list = this.employmentTypeMapper.list(type); //전체 리스트
		for(int i = 0 ; i < list.size() ; i++) {
			if("Y".equals(list.get(i).getState())) {
				listY.add(count++, list.get(i));	//전체 리스트 중 상태가 Y인것만
			}
		}
		count = 0;
		//검색조건 : 유형
		if("type".equals(purpose.get(0)) && purpose.size() == 2) {
			List<EmploymentType> listType = new ArrayList<EmploymentType>();
			for(int i = 0 ; i < listY.size() ; i++) { 
				if(purpose.get(1).equals(listY.get(i).getName())) {
					listType.add(count++, listY.get(i));
				}
			}
			return listType;
		//검색조건 : 연도
		} else if ("year".equals(purpose.get(0))) {
			List<EmploymentType> listYear = new ArrayList<EmploymentType>();
			for(int i = 0 ; i < listY.size() ; i++) {
				if(purpose.get(1).equals(Integer.toString(listY.get(i).getYear()))) {
					listYear.add(count++, listY.get(i));
				}
			}
			return listYear;
		}
		return listY;
	}
	
	@Override
	public void add(EmploymentType type) {
		this.employmentTypeMapper.insert(type);
	}

	@Override
	public void edit(EmploymentType type) {
		this.employmentTypeMapper.update(type);

	}

	@Override
	public EmploymentType view(int no) {
		return this.employmentTypeMapper.select(no);
	}

	@Override
	public void remove(int no) {
		this.employmentTypeMapper.delete(no);
	}
}
