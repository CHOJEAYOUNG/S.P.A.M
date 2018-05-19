package com.spam.persistence;

import java.util.List;

import com.spam.domain.SpamUser;

public interface LoginMapper {
	public SpamUser select(SpamUser spamuser);
	public List<SpamUser> list();
	
}
