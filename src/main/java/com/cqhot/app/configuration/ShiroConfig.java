package com.cqhot.app.configuration;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.cqhot.app.shiro.AuthRealm;

@Configuration
public class ShiroConfig {
	
	@Bean
	public ShiroFilterFactoryBean shiroFileter(SecurityManager securityManager) {
		ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
		bean.setSecurityManager(securityManager);
		bean.setLoginUrl("/login.jsp");
		bean.setSuccessUrl("/index.jsp");
		Map<String,String> filterMap = new LinkedHashMap<>();
		//开放登陆接口
		filterMap.put("/user/login", "anon");
		//拦截首页
		filterMap.put("/index.jsp", "authc");
		//主要这行代码必须放在所有权限设置的最后，不然会导致所有 url 都被拦截
		bean.setFilterChainDefinitionMap(filterMap);
		System.out.println("Shiro拦截器工厂类注入成功");
		return bean;
	}
	
	@Bean
	public SecurityManager securityManager(AuthRealm authRealm) {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(authRealm);
		return securityManager;
	}
//	@Bean
//	public AuthRealm authRealm() {
//		return new AuthRealm();
//	} 
}
