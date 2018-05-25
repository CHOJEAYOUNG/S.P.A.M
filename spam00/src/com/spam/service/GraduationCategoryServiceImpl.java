package com.spam.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spam.domain.GraduationCategory;
import com.spam.persistence.GraduationCategoryMapper;

@Service
public class GraduationCategoryServiceImpl implements GraduationCategoryService {
	@Resource
	private GraduationCategoryMapper graduationCategoryMapper;

	@Override
	public List<GraduationCategory> find(GraduationCategory category, List<String> purpose) {
		List<GraduationCategory> listY = new ArrayList<GraduationCategory>();

		int count = 0;
		List<GraduationCategory> list = this.graduationCategoryMapper.list(); // 전체 리스트
		for (int i = 0; i < list.size(); i++) {
			if ("Y".equals(list.get(i).getState())) {
				listY.add(count++, list.get(i)); // 전체 리스트 중 상태가 Y인것만
			}
		}
		count = 0;
		// 검색조건 : 카테고리 명
		if ("name".equals(purpose.get(0)) && purpose.size() == 2) {
			List<GraduationCategory> listName = new ArrayList<GraduationCategory>();
			for (int i = 0; i < listY.size(); i++) {
				if (purpose.get(1).equals(listY.get(i).getName())) {
					listName.add(count++, listY.get(i));
				}
			}
			return listName;
			// 검색조건 : 조건
		} else if ("condition".equals(purpose.get(0))) {
			List<GraduationCategory> listCondition = new ArrayList<GraduationCategory>();
			for (int i = 0; i < listY.size(); i++) {
				if (purpose.get(1).equals("필수")) {
					listCondition.add(count++, listY.get(i));
				} else if (purpose.get(1).equals("선택")) {
					listCondition.add(count++, listY.get(i));
				}
			}
			return listCondition;
		}
		return listY;
	}

	@Override
	public void add(GraduationCategory category) {
		this.graduationCategoryMapper.insert(category);
	}

	@Override
	public void edit(GraduationCategory category) {
		this.graduationCategoryMapper.update(category);
	}

	@Override
	public GraduationCategory view(int no) {
		return this.graduationCategoryMapper.select(no);
	}

	@Override
	public void remove(int no) {
		this.graduationCategoryMapper.delete(no);
	}
}