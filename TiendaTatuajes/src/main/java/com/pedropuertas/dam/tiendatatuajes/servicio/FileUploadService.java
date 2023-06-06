package com.pedropuertas.dam.tiendatatuajes.servicio;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	public void uploadFile(MultipartFile file) throws IllegalStateException, IOException {
	
		file.transferTo(new File(System.getProperty("user.dir") + "\\src\\main\\resources\\static\\img\\" + file.getOriginalFilename()));
		
	}
	
}
