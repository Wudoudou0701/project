package com.bw.mapper;

import java.util.List;
import java.util.Map;

import com.bw.bean.Plant;
import com.bw.bean.Type;

public interface PlantMapperDao {
    List<Map<String,Object>> findPlantList(Map<String,Object> map);

	int add(Plant plant);

	List<Type> getTypeList();

	int update(Plant plant);

	Plant getPlantById(Plant plant);

	int deleteAll(String [] pids);
}
