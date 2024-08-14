package com.example.websocket.config;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.converter.DefaultContentTypeResolver;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.messaging.converter.MessageConverter;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import java.util.List;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
// 이 설정은 스프링 부트 애플리케이션에서 웹소켓을 사용하여 실시간 양방향 통신을 설정하는 데 필요한 구성 요소들을 정의
	
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/user");	// /user로 시작하는 경로를 대상으로 하는 메시지를 브로커가 처리하도록 설정합니다.
        registry.setApplicationDestinationPrefixes("/app");	// 애플리케이션의 메시지 목적지 경로의 접두사를 /app으로 설정합니다.
        registry.setUserDestinationPrefix("/user");	// 사용자 특정 목적지 경로의 접두사를 /user으로 설정합니다.
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")	// ws 경로에 STOMP 엔드포인트를 등록합니다.
        		.setAllowedOrigins("*")
                .withSockJS();	// SockJS 폴백 옵션을 활성화하여 웹소켓을 지원하지 않는 브라우저에서도 웹소켓을 사용할 수 있게 합니다.
    }

    @Override
    public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
        DefaultContentTypeResolver resolver = new DefaultContentTypeResolver();	// 기본 콘텐츠 타입 해석기를 생성
        resolver.setDefaultMimeType(MimeTypeUtils.APPLICATION_JSON);	// 기본 MIME 타입을 application/json으로 설정
        MappingJackson2MessageConverter converter = new MappingJackson2MessageConverter();	// Jackson 기반의 메시지 변환기를 생성
        converter.setObjectMapper(new ObjectMapper());	// Jackson의 ObjectMapper를 설정합니다.
        converter.setContentTypeResolver(resolver);	// 변환기에 콘텐츠 타입 해석기를 설정
        messageConverters.add(converter);	// 변환기를 메시지 변환기 목록에 추가
        return false;	// 기본 설정된 메시지 변환기 이외의 추가적인 커스텀 메시지 변환기를 사용하지 않도록 합니다.
    }
    
    
}
