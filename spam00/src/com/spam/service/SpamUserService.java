package com.spam.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.spam.domain.Enrollment;
import com.spam.domain.SpamUser;

public interface SpamUserService {
	public SpamUser view(SpamUser spamuser);
	public void edit(SpamUser spamuser);
	public List<SpamUser> list(SpamUser spamuser, HttpServletRequest request);
	public void add(SpamUser spamuser);
	public List<Enrollment> enrollments();
}
