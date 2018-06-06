package com.spam.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.spam.domain.SpamUser;
import com.spam.persistence.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService {
	@Resource
	private LoginMapper loginMapper;

	@Override
	   public boolean login(SpamUser spamuser, HttpServletRequest request) {
	      HttpSession session = request.getSession(true);
	      SpamUser spamuserTwo;
	      spamuserTwo = loginMapper.select(spamuser);
	      
	      if(spamuserTwo != null) {
	         if("A".equals(spamuserTwo.getPower())) {
	            session.setAttribute("isLogin", true);
	            session.setAttribute("id", spamuser.getId());
	            session.setAttribute("power", "A");
	            session.setAttribute("name", spamuserTwo.getName());
	         }else if("P".equals(spamuserTwo.getPower())) {
	            session.setAttribute("isLogin", true);
	            session.setAttribute("id", spamuser.getId());
	            session.setAttribute("power", "P");
	            session.setAttribute("name", spamuserTwo.getName());
	         } else if("S".equals(spamuserTwo.getPower())) {
	            session.setAttribute("isLogin", true);
	            session.setAttribute("id", spamuser.getId());
	            session.setAttribute("power", "S");
	            session.setAttribute("name", spamuserTwo.getName());
	         } else {
	            return false;
	      }
	         return true;
	      }
	      return false;
	   }

	@Override
	public List<SpamUser> list(HttpServletRequest request,SpamUser spamuser) {
		HttpSession session = request.getSession(false);
		
		List<SpamUser> list = loginMapper.list();
		if(session.getAttribute("power") == "A") {
			return list;
		}else if(session.getAttribute("power") == "P") {
			int id = (int)session.getAttribute("id");
			for(int i =0; i < list.size(); i++) {
				if("A".equals(list.get(i).getPower())) {
					list.remove(i);
					i=0;
				}else if("P".equals(list.get(i).getPower()) 
						&& id != list.get(i).getId()) {
					list.remove(i);
					i=0;
				}
			}
			return list;
		}else {
			spamuser = loginMapper.select(spamuser);
			
			List<SpamUser> list2 = new ArrayList<SpamUser>();
			
			list2.add(0, spamuser);
			
			return list2;
		}
	}
}