package com.example.websocket.image;

import java.io.IOException;
import java.io.InputStream;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsResource;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.model.GridFSFile;

@Service
public class FileService {

    @Autowired
    private GridFsTemplate gridFsTemplate;

    @Autowired
    private GridFSBucket gridFSBucket;

    public ObjectId uploadFile(MultipartFile file) throws IOException {
        try (InputStream inputStream = file.getInputStream()) {
            return gridFsTemplate.store(inputStream, file.getOriginalFilename(), file.getContentType());
        }
    }

    public GridFSFile findFileById(String id) {
        return gridFsTemplate.findOne(new Query(Criteria.where("_id").is(id)));
    }

    public GridFsResource downloadFile(String id) {
        GridFSFile gridFSFile = findFileById(id);
        if (gridFSFile != null) {
            return gridFsTemplate.getResource(gridFSFile);
        }
        return null;
    }
    
    public String getFileUrl(String id) {
        return "/files/download/" + id;
    }
}
