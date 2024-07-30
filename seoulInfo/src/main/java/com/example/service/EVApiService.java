package com.example.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.dao.EVApiDAO;
import com.example.domain.EVApiVO;

public interface EVApiService {

	public String getParkingInfo() throws IOException;
}
