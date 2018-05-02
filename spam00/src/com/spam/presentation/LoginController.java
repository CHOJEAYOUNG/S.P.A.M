package com.spam.presentation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
		ModelAndView modelAndView = new ModelAndView("/main");
		HttpSession session = request.getSession(false);
		
		if(spamuser.getSpamId() == 0 
				|| spamuser.getSpamId() == ' '
					|| "".equals(spamuser.getPassWord())
						|| spamuser.getPassWord() == null) {
			return new ModelAndView("login");
		}
		boolean chack = false;
		chack = loginService.login(spamuser, request);
		if(chack != true) {
			return new ModelAndView("/login");
		} else {
			List<SpamUser> listSpam = this.loginService.list(request, spamuser);
			
			modelAndView.addObject("listSpam", listSpam);
			modelAndView.addObject("rank",session.getAttribute("rank"));
			
			return modelAndView;
		}
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(SpamUser spamuser, HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}

		return new ModelAndView(new RedirectView("/login"));
	}
}
