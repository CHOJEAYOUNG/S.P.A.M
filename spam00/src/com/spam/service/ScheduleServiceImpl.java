package com.spam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam.domain.Schedule;
import com.spam.persistence.ScheduleMapper;

@Service
public class ScheduleServiceImpl implements ScheduleService{

		@Resource
		private ScheduleMapper scheduleMapper;

		@Override
		public List<Schedule> list(Schedule schedule) {
			return this.scheduleMapper.list(schedule);
		}

		@Override
		@Transactional
		public void add(Schedule schedule) {
			schedule.setQuarter(0);
			this.scheduleMapper.insert(schedule);
		}

		@Override
		public Schedule view(Schedule schedule) {
			return this.scheduleMapper.select(schedule);
		}

		@Override
		@Transactional
		public void edit(Schedule schedule) {
			this.scheduleMapper.update(schedule);
		}
		
		@Override
		@Transactional
		public void delete(Schedule schedule) {
			this.scheduleMapper.delete(schedule);
		}


}
