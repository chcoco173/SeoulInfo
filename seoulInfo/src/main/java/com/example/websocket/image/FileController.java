package com.example.websocket.image;


import java.io.IOException;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.mongodb.gridfs.GridFsResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/files")
public class FileController {

    @Autowired
    private FileService fileService;
    
    // 파일을 MultipartFile로 받아서 fileService.uploadFile을 통해 저장합니다.
    // 저장된 파일의 ID로 파일 URL을 생성하여 클라이언트에 반환합니다.
    @PostMapping("/upload")
    public ResponseEntity<?> uploadFile(@RequestParam("file") MultipartFile file) {
        try {
            ObjectId id = fileService.uploadFile(file);
            String fileUrl = fileService.getFileUrl(id.toString());
            return ResponseEntity.ok().body("{\"url\":\"" + fileUrl + "\"}");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }

    // 파일 ID를 받아 fileService.downloadFile을 통해 파일을 찾습니다.
    // 파일이 존재하면 파일을 ResponseEntity에 담아 반환합니다.
    @GetMapping("/download/{id}")
    public ResponseEntity<?> downloadFile(@PathVariable String id) {
        try {
            GridFsResource fileResource = fileService.downloadFile(id);
            if (fileResource == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("File not found");
            }

            String filename = fileResource.getFilename();
            // UTF-8로 인코딩된 파일 이름 설정
            String encodedFilename = java.net.URLEncoder.encode(filename, "UTF-8").replace("+", "%20");
            String contentDisposition = String.format("attachment; filename*=UTF-8''%s", encodedFilename);

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                    .contentType(MediaType.parseMediaType(fileResource.getContentType()))
                    .body(new InputStreamResource(fileResource.getInputStream()));
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }
}
