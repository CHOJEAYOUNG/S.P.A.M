package com.spam.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.spam.domain.Enrollment;
import com.spam.domain.SpamUser;
import com.spam.persistence.EnrollmentMapper;
import com.spam.persistence.SpamUserMapper;

@Service
public class SpamUserServiceImpl implements SpamUserService {
	
	@Resource
	private SpamUserMapper spamUserMapper;
	@Resource
	private EnrollmentMapper enrollmentMapper;
	
	@Override
	public SpamUser view(SpamUser spamuser) {
		spamuser = spamUserMapper.select(spamuser);
		
		return spamuser;
	}

	@Override
	public List<SpamUser> list(SpamUser spamuser, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		List<SpamUser> listSpamUser = spamUserMapper.list();
		
		if(session.getAttribute("power") == "A") {
			return listSpamUser;
		}else {
			int id = (int)session.getAttribute("id");
			for(int i =0; i < listSpamUser.size(); i++) {
				if("A".equals(listSpamUser.get(i).getPower())) {
					listSpamUser.remove(i);
					i=0;
				}else if("P".equals(listSpamUser.get(i).getPower()) 
						&& id != listSpamUser.get(i).getId()) {
					listSpamUser.remove(i);
					i=0;
				}
			}
			return listSpamUser;
		}
	}

	@Override
	public List<Enrollment> enrollments() {
		return enrollmentMapper.select();
	}
}
