package com.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
//@EnableWebMvc
@RequiredArgsConstructor
public class SecurityConfig implements WebMvcConfigurer {
	
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();        
    }

    
    

}

//@Bean
//public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//  http
//      .authorizeHttpRequests(authorize -> authorize
//          .requestMatchers("/member/**","index","/").permitAll() // "/member/**" 경로는 모두 접근 허용
//          .anyRequest().authenticated() // 다른 요청은 인증 필요
//      )
//      .formLogin(formLogin -> formLogin
//          .loginPage("/")		// 로그인 페이지 설정
//          .permitAll()				// 로그인 페이지는 모두 접근 허용
//      )
//      .logout(logout -> logout
//          .permitAll()				// 로그아웃 페이지는 모두 접근 허용
//      )
//      .sessionManagement(sessionManagement -> sessionManagement
//          .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
//          .maximumSessions(1)
//          .maxSessionsPreventsLogin(true) // 최대 세션 수 설정
//      );
//  return http.build();
//}
//
//@Bean
//public PasswordEncoder passwordEncoder() {
//  return new BCryptPasswordEncoder();
//}
//
//@Bean
//public WebSecurityCustomizer webSecurityCustomizer() {
//  return (web) -> web.ignoring().requestMatchers("/resources/**");
//}

