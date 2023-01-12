package com.clickgo.project.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.clickgo.project.entity.User;
import com.clickgo.project.model.enums.RoleType;

public class PrincipalDetails implements UserDetails {

	private User user;

	public PrincipalDetails(User user) {
		if (user.getRole() == RoleType.BLACKLIST) {
			this.user = null;
		} else {
			this.user = user;
		}
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collection = new ArrayList<>();
		collection.add(() -> {
			return "ROLE_" + user.getRole();
		});
		return collection;
	}

	@Override
	public String getPassword() {
		try {
		return user.getPassword();
		} catch (Exception e) {
			System.err.println("정지당한 유저의 접속 시도");
		}
		return null;
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
