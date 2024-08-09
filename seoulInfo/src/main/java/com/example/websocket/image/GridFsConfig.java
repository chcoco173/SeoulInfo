package com.example.websocket.image;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.MongoDatabaseFactory;
import org.springframework.data.mongodb.core.convert.MappingMongoConverter;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;

import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;

@Configuration
public class GridFsConfig {
//	이 클래스는 Spring의 빈을 정의하여 MongoDB GridFS를 사용하도록 설정합니다.
//	GridFS는 대용량 파일을 MongoDB에 저장할 수 있게 합니다.
//	GridFSBucket은 GridFS의 기본 인터페이스를 제공하고, GridFsTemplate은 이를 더 쉽게 사용할 수 있는 도구입니다.
    @Bean
    public GridFSBucket getGridFSBucket(MongoDatabaseFactory mongoDatabaseFactory) {
        return GridFSBuckets.create(mongoDatabaseFactory.getMongoDatabase());
    }

    @Bean
    public GridFsTemplate gridFsTemplate(MongoDatabaseFactory mongoDbFactory, MappingMongoConverter converter) {
        return new GridFsTemplate(mongoDbFactory, converter);
    }
}
