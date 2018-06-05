package com.spam.presentation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.SpamUser;
import com.spam.service.LoginService;
import com.spam.service.SpamUserService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private SpamUserService spamUserService;
		
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginGet(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView("/login");
		boolean isLogin =  session.getAttribute("isLogin") != null ? (boolean)session.getAttribute("isLogin") : false;
		
		if(isLogin) {
			return new ModelAndView(new RedirectView("/main"));
		}
		return modelAndView;
	}
	@RequestMapping(value = "/remain", method = RequestMethod.POST)
	public ModelAndView remain(HttpServletRequest request) {
		return new ModelAndView("/login");
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(SpamUser spamuser, HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		boolean chack = loginService.login(spamuser, request);
		if(!chack) {
			return new ModelAndView(new RedirectView("/logout"));
		} else {
			String str = session.getAttribute("power") != null ? (String)session.getAttribute("power") : null;
			
			if("S".equals(str)) {
				SpamUser spam = new SpamUser();
				spam.setId((int)session.getAttribute("id"));
				spam = spamUserService.view(spam);
				if(spam.getBirthDate().equals(spam.getPassWord())) {
					return new ModelAndView(new RedirectView("/spamUser/edit/"+spam.getId()));
				}else {
					return new ModelAndView(new RedirectView("/spamUser/viewS?id="+session.getAttribute("id")));
				}
			}else {
				return new ModelAndView(new RedirectView("/spamUser/list"));
			}
		}
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}
		return new ModelAndView(new RedirectView("/main"));
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView spamMain(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView("/main");
		SpamUser spamuser = new SpamUser();

		boolean isLogin =  session.getAttribute("isLogin") != null ? (boolean)session.getAttribute("isLogin") : false;
		if(isLogin) {
			int id = (int)session.getAttribute("id");
			spamuser.setId(id);
			spamuser = spamUserService.view(spamuser);
			modelAndView.addObject("spamuser",spamuser);
		}
	
		return modelAndView;
	}
}
