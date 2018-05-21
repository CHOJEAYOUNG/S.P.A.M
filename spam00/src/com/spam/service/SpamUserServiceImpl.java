package com.spam.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
		spamuser.setPhoneNo1(spamuser.getPhoneNo().split("[-]")[0]);
		spamuser.setPhoneNo2(spamuser.getPhoneNo().split("[-]")[1]);
		spamuser.setPhoneNo3(spamuser.getPhoneNo().split("[-]")[2]);
		
		return spamuser;
	}

	@Override
	public List<SpamUser> list(SpamUser spamuser, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		List<SpamUser> listSpamUser = spamUserMapper.list();
		
		if("A".equals(session.getAttribute("power"))) {
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

	@Override
	@Transactional
	public void edit(SpamUser spamuser) {
		spamuser.setPhoneNo(spamuser.getPhoneNo1()+"-"+spamuser.getPhoneNo2()+"-"+spamuser.getPhoneNo3());
		spamUserMapper.update(spamuser);
		
	}

	@Override
	public void add(SpamUser spamuser) {
		spamuser.setPhoneNo(spamuser.getPhoneNo1()+"-"+spamuser.getPhoneNo2()+"-"+spamuser.getPhoneNo3());
		spamuser.setPassWord(spamuser.getBirthDate());
		System.out.println(spamuser.toString());
		
		if(spamuser.getOffice() != null) {
			spamuser.setPower("P");
			spamUserMapper.insertP(spamuser);
		} else {
			spamuser.setPower("S");
			spamuser.setOffice("");
			spamUserMapper.insertS(spamuser);
		}
	}
}
