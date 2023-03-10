package com.clickgo.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

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
						 "/store/**", "/view-more/**", "/storeImage/**")
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
				  .logoutUrl("/logout") /*???????????? url*/ 
				  .logoutSuccessUrl("/auth/login-form") /*???????????? ????????? ????????? url*/ 
				  .invalidateHttpSession(true)/*??????????????? ?????? ??????*/
				  .deleteCookies("JSESSIONID")/*????????????*/
				  .clearAuthentication(true)/*???????????? ??????*/
				  .permitAll()
				  .and()
				  .sessionManagement()
				  .maximumSessions(1) /*session ?????? ???????*/
				  .expiredUrl("/auth/login-form") /* session ????????? ?????? */
				  .maxSessionsPreventsLogin(false); /* ??????????????? ??????(true),??????(false)*/
	}
	
}
