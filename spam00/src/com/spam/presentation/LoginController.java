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

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginGet(HttpServletRequest request) {
		return new ModelAndView("/login");
	}
	@RequestMapping(value = "/remain", method = RequestMethod.POST)
	public ModelAndView remain(HttpServletRequest request) {
		return new ModelAndView("/login");
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(SpamUser spamuser, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
<<<<<<< HEAD
		
		if(spamuser.getId() == 0 
				|| spamuser.getId() == ' '
					|| "".equals(spamuser.getPassWord())
						|| spamuser.getPassWord() == null) {
			return new ModelAndView("/login");
		}
=======
>>>>>>> refs/remotes/origin/SUB_KIM
		boolean chack = false;
		
		chack = loginService.login(spamuser, request);
		if(!chack) {
<<<<<<< HEAD
			return new ModelAndView("/logout");
=======
			return new ModelAndView(new RedirectView("/logout"));
>>>>>>> refs/remotes/origin/SUB_KIM
		} else {
<<<<<<< HEAD
=======
			System.out.println(session.getAttribute("power"));
>>>>>>> refs/remotes/origin/SUB_KIM
			String str = session.getAttribute("power") != null ? (String)session.getAttribute("power") : null;
			
			if("S".equals(str)) {
				return new ModelAndView(new RedirectView("/spamUser/viewS?id="+session.getAttribute("id")));
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
		return new ModelAndView(new RedirectView("/login"));
	}
}
