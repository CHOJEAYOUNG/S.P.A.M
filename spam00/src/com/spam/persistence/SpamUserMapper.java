package com.spam.persistence;


import java.util.List;

import com.spam.domain.SpamUser;

public interface SpamUserMapper {
	public SpamUser select(SpamUser spamuser);
	public void update(SpamUser spamuser);
	public List<SpamUser> list();
	public void insertS(SpamUser spamuser);
	public void insertP(SpamUser spamuser);
}
