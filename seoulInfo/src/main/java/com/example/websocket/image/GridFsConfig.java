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

    @Bean
    public GridFSBucket getGridFSBucket(MongoDatabaseFactory mongoDatabaseFactory) {
        return GridFSBuckets.create(mongoDatabaseFactory.getMongoDatabase());
    }

    @Bean
    public GridFsTemplate gridFsTemplate(MongoDatabaseFactory mongoDbFactory, MappingMongoConverter converter) {
        return new GridFsTemplate(mongoDbFactory, converter);
    }
}
