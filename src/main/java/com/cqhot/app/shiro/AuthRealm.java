package com.cqhot.app.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cqhot.app.dao.UserMapper;
import com.cqhot.app.entity.User;

@Component
public class AuthRealm extends AuthorizingRealm{
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("---权限验证---");
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		//权限控制
		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("---身份验证---");
		UsernamePasswordToken loginToken = (UsernamePasswordToken) token;
		String loginname = loginToken.getUsername();
		User user = userMapper.shiroLogin(loginname);
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getPassword(),this.getName());
		return info;
	}

}
