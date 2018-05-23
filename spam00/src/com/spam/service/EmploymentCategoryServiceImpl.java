package com.spam.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spam.domain.EmploymentCategory;
import com.spam.domain.EmploymentType;
import com.spam.persistence.EmploymentCategoryMapper;

@Service
public class EmploymentCategoryServiceImpl implements EmploymentCategoryService {
	@Resource
	private EmploymentCategoryMapper employmentCategoryMapper;
	@Resource
	private EmploymentTypeServiceImpl employmentTypeServiceImpl;

	@Override
	public List<EmploymentCategory> find(EmploymentCategory category, List<String> purpose) {
		List<EmploymentCategory> listY = new ArrayList<EmploymentCategory>();
		
		int count = 0;
		List<EmploymentCategory> list = this.employmentCategoryMapper.list(category); //��ü ����Ʈ
		for(int i = 0 ; i < list.size(); i++) {
			if("Y".equals(list.get(i).getState())) {
				listY.add(count++, list.get(i));	//��ü ����Ʈ �� ���°� Y�ΰ͸�
			}
		}
		count = 0;
		//�˻����� : ī�װ� �� 
		if("name".equals(purpose.get(0)) && purpose.size() == 2) {
			List<EmploymentCategory> listName = new ArrayList<EmploymentCategory>();
			for(int i = 0 ; i < listY.size() ; i++) {
				if(purpose.get(1).equals(listY.get(i).getName())) {
					listName.add(count++, listY.get(i));
				}
			}
			return listName;
		//�˻����� : ����
		} else if("condition".equals(purpose.get(0))) {
			List<EmploymentCategory> listCondition = new ArrayList<EmploymentCategory>();
			for(int i = 0 ; i < listY.size() ; i++) {
				if(purpose.get(1).equals("�ʼ�")) {
					listCondition.add(count++, listY.get(i));
				} else if(purpose.get(1).equals("����")) {
					listCondition.add(count++, listY.get(i));
				}
			}
			return listCondition;
		}
		return listY;
	}

	@Override
	public void add(EmploymentCategory category) {
		this.employmentCategoryMapper.insert(category);
	}

	@Override
	public void edit(EmploymentCategory category) {
		this.employmentCategoryMapper.update(category);
	}

	@Override
	public EmploymentCategory view(int no) {
		return this.employmentCategoryMapper.select(no);
	}

	@Override
	public void remove(int no) {
		this.employmentCategoryMapper.delete(no);
	}

}
