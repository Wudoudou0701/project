package com.bw.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bw.bean.Plant;
import com.bw.bean.Type;
import com.bw.mapper.PlantMapperDao;
@Service
public class PlantServiceImpl implements PlantService{

	@Resource
	private PlantMapperDao plantMapperDao;
	
	@Override
	public List<Map<String, Object>> findPlantList(Map<String, Object> map) {
		return plantMapperDao.findPlantList(map);
	}

	@Override
	public int add(Plant plant) {
		return plantMapperDao.add(plant);
	}

	@Override
	public List<Type> getTypeList() {
		return plantMapperDao.getTypeList();
	}

	@Override
	public int update(Plant plant) {
		return plantMapperDao.update(plant);
	}

	@Override
	public Plant getPlantById(Plant plant) {
		return plantMapperDao.getPlantById(plant);
	}

	@Override
	public int deleteAll(String[] pids) {
		return plantMapperDao.deleteAll(pids);
	}

}
