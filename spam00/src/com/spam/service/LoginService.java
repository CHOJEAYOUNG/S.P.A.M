package com.spam.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spam.domain.SpamUser;

public interface LoginService {
	public boolean login(SpamUser spamuser, HttpServletRequest request);
	public List<SpamUser> list(HttpServletRequest request, SpamUser spamuser);
}
