package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.user;
import jsonInfo.jsonInfo;
import jsonInfo.searchInfo;
import service.user_service;


@Controller
@RequestMapping("user")
public class user_controller {
	@Autowired
	user_service service;
	
      @RequestMapping("user-list")
	public void select(ModelMap m,user ad) {
  		 m.put("status",ad.statuss);
	     m.put("list",service.selectAll());
	}
      @RequestMapping("update_off")
      public @ResponseBody List<user> update_off(Integer id) {
 		 service.update_off(id);
		 List<user> list=service.byId(id);
		 return list;
	}
      @RequestMapping("update_on")
      public  @ResponseBody List<user> update_on(Integer id) {
		 service.update_on(id);
		 List<user> list=service.byId(id);
		 return list;
	}
      
      @RequestMapping("urepass")
      public @ResponseBody jsonInfo urepass(Integer id) {
    	  if(service.urepass(id)>0) {
    		  return new jsonInfo(1, "重置成功");
    	  }
    	  return new jsonInfo(0, "操作失败");
      }
    
      
}
