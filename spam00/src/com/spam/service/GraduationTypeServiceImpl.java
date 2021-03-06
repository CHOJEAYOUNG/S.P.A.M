package com.spam.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spam.domain.GraduationType;
import com.spam.persistence.GraduationTypeMapper;

@Service
public class GraduationTypeServiceImpl implements GraduationTypeService {
	@Resource
	private GraduationTypeMapper graduationTypeMapper;

	@Override
	public List<GraduationType> find(GraduationType type, List<String> purpose) {
		List<GraduationType> list = new ArrayList<GraduationType>();
		List<GraduationType> listY = new ArrayList<GraduationType>();
		int count = 0;
		list = this.graduationTypeMapper.list(); //전체 리스트
		for(int i = 0 ; i < list.size() ; i++) {
			if("Y".equals(list.get(i).getState())) {
				listY.add(count++, list.get(i));	//전체 리스트 중 상태가 Y인것만
			}
		}
		count = 0;
		//검색조건 : 유형
		if("type".equals(purpose.get(0)) && purpose.size() == 2) {
			List<GraduationType> listType = new ArrayList<GraduationType>();
			for(int i = 0 ; i < listY.size() ; i++) { 
				if(purpose.get(1).equals(listY.get(i).getName())) {
					listType.add(count++, listY.get(i));
				}
			}
			return listType;
		//검색조건 : 연도
		} else if ("year".equals(purpose.get(0))) {
			List<GraduationType> listYear = new ArrayList<GraduationType>();
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
	public void add(GraduationType type) {
		this.graduationTypeMapper.insert(type);
	}

	@Override
	public void edit(GraduationType type) {
		this.graduationTypeMapper.update(type);

	}

	@Override
	public GraduationType view(int no) {
		return this.graduationTypeMapper.select(no);
	}

	@Override
	public void remove(int no) {
		this.graduationTypeMapper.delete(no);
	}
}
