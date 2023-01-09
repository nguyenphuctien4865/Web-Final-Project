package com.newspaper.app.services;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class UploadFile {

	public Cloudinary cloudinaryConfigs() {
		Cloudinary cloudinary = null;
		Map config = new HashMap<>();
		config.put("cloud_name", "dyhy5jhmp");
		config.put("api_key", "884398671429262");
		config.put("api_secret", "81gbFwoCD2gR0WUAM1LY28uJQaA");
		cloudinary = new Cloudinary(config);
		return cloudinary;
	}

	public String uploadFile(File file) {
		try {
			Map uploadResult = cloudinaryConfigs().uploader().uploadLarge(file,
					ObjectUtils.asMap("resource_type", "auto"));
			file.delete();
			return uploadResult.get("url").toString();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
