package com.clickgo.project.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.clickgo.project.dto.res.User;
import com.clickgo.project.repository.IUserRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PrincipalDetailsService implements UserDetailsService {

   private IUserRepository userRepository;

   @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      User principal = userRepository.findByUsername(username).orElseThrow(() -> {
         return new IllegalArgumentException("존재하지 않는 회원입니다.");
      }); 
      return new PrincipalDetails(principal);
   }
}
