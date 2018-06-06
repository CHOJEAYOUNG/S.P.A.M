package com.spam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam.domain.TimeTable;
import com.spam.persistence.TimeTableMapper;

@Service
public class TimeTableServiceImpl implements TimeTableService{

		@Resource
		private TimeTableMapper timeTableMapper;

		@Override
		public List<TimeTable> list(TimeTable timeTable) {
			return this.timeTableMapper.list(timeTable);
		}

		@Override
		@Transactional
		public void add(TimeTable timeTable) {
			
			this.timeTableMapper.insert(timeTable);
		}

		@Override
		public TimeTable view(TimeTable timeTable) {
			return this.timeTableMapper.select(timeTable);
		}

		@Override
		@Transactional
		public void edit(TimeTable timeTable) {
			this.timeTableMapper.update(timeTable);
		}
}
