package com.bw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.bean.Plant;
import com.bw.bean.Type;
import com.bw.service.PlantService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class PlantController {

   @Resource
   private PlantService  plantService;
	
	@RequestMapping("list.do")
	public String list(Model model,@RequestParam(defaultValue="")String pname,@RequestParam(defaultValue="1")int cpage) {
		Map<String,Object> map=new HashMap<>();
		map.put("pname", pname);
		PageHelper.startPage(cpage, 2);
		List<Map<String,Object>> findPlantList = plantService.findPlantList(map);
		PageInfo<Map<String,Object>> pageInfo=new PageInfo<>(findPlantList);
		model.addAttribute("findPlantList", findPlantList);
		model.addAttribute("map", map);
		model.addAttribute("pname", pname);
		model.addAttribute("page", pageInfo);
		return "list";
	}
	
	
	@RequestMapping("toAdd.do")
	public String toAdd() {
		return "add";
		
		
	} 
	
	@RequestMapping("add.do")
	@ResponseBody
	public int add(Plant plant) {
	int i=plantService.add(plant);
		return i;
		
		
	} 
	
	@RequestMapping("getTypeList.do")
	@ResponseBody
	public Object getTypeList() {
		List<Type> getTypeList=plantService.getTypeList();
		return getTypeList;
	} 
	
	@RequestMapping("toUpdate.do")
	public String toUpdate(Plant plant,Model model) {
		plant=plantService.getPlantById(plant);
		model.addAttribute("plant", plant);
		return "update";
	} 
	
	@RequestMapping("update.do")
	@ResponseBody
	public int update(Plant plant) {
	int i=plantService.update(plant);
		return i;
	
	} 
	

	@RequestMapping("deleteAll.do")
	@ResponseBody
	public int deleteAll(String [] pids) {
	int i=plantService.deleteAll(pids);
		return i;
	
	} 
}
