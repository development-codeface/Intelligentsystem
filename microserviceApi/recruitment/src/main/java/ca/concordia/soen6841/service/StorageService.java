package ca.concordia.soen6841.service;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

public interface StorageService {

	void init();

	void store(MultipartFile file);

	Stream<Path> loadAll();

	Path load(String filename);

	Resource loadAsResource(String filename);
	
	Resource loadAsResource(String folder, String filename);

	void deleteAll();
	
	void store(String path, String filename, String desc);

}