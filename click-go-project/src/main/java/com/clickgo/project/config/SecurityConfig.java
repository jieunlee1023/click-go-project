package com.clickgo.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.clickgo.project.auth.PrincipalDetailsService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private PrincipalDetailsService detailsService;
	
	@Autowired
	private UserLoginFailHandler userLoginFailHandler;

	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean
	public BCryptPasswordEncoder encoderPWD() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(detailsService).passwordEncoder(encoderPWD());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		http.authorizeHttpRequests()
				.antMatchers("/auth/**", "/api/**", "/", "/js/**", "/css/**", "/layout/**", "/jsp/**", "/image/**",
						 "/store/**", "/view-more/**", "/mypage/**", "/admin/**")
				.permitAll()
				.anyRequest()
				.authenticated()
				.and()
				.formLogin()
				.usernameParameter("username")
				.passwordParameter("password")
				.loginPage("/auth/login-form")
				.loginProcessingUrl("/auth/loginProc")
				.failureHandler(userLoginFailHandler)
				.and()
				.logout() 
				  .logoutUrl("/logout") /*로그아웃 url*/ 
				  .logoutSuccessUrl("/auth/login-form") /*로그아웃 성공시 연결할 url*/ 
				  .invalidateHttpSession(true)/*로그아웃시 세션 제거*/
				  .deleteCookies("JSESSIONID")/*쿠키제거*/
				  .clearAuthentication(true)/*권한정보 제거*/
				  .permitAll()
				  .and()
				  .sessionManagement()
				  .maximumSessions(1) /*session 허용 갯수?*/
				  .expiredUrl("/auth/login-form") /* session 만료시 이동 */
				  .maxSessionsPreventsLogin(false); /* 중복로그인 허용(true),거부(false)*/
	}
	
}
