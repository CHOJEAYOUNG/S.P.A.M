package com.spam.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam.domain.Advice;
import com.spam.persistence.AdviceMapper;


@Service
public class AdviceServiceImpl implements AdviceService{

		@Resource
		private AdviceMapper adviceMapper;

		@Override
		public List<Advice> list(Advice advice) {
			return this.adviceMapper.list(advice);
		}

		@Override
		@Transactional
		public void add(Advice advice) {
			long time = System.currentTimeMillis();
		      SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		      String str = dayTime.format(new Date(time));
		      advice.setRegistration(str);
			this.adviceMapper.insert(advice);
	}

		@Override
		public Advice view(Advice advice) {
		return this.adviceMapper.select(advice);
		}

		@Override
		@Transactional
		public void edit(Advice advice) {
			long time = System.currentTimeMillis();
		      SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		      String str = dayTime.format(new Date(time));
		      advice.setAssentDate(str);
		     
		      System.out.println(advice.toString());
			this.adviceMapper.update(advice);
		}
		
		@Override
		@Transactional
		public void delete(Advice advice) {
			this.adviceMapper.delete(advice);
		}


}
