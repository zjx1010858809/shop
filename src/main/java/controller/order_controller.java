package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Order;
import jsonInfo.jsonInfo;
import service.order_service;

@Controller
@RequestMapping("order")
public class order_controller {
	@Autowired
	order_service service;
	
    @RequestMapping("order-list")
	public void select(ModelMap m) {
		m.put("list",service.select());
	}
    @RequestMapping("agree")
    public @ResponseBody List<Order> agree(int id) {
    	service.agree(id);
    	List<Order> list = service.byId(id);
    	return list;
    }
    @RequestMapping("refuse")
    public @ResponseBody List<Order> refuse(int id) {
    	service.refuse(id);
    	List<Order> list = service.byId(id);
    	return list;
    }
    @RequestMapping("seedetails")
	  	public String see(Integer orders_id,ModelMap m) {
    	m.put("list",service.seedetails(orders_id));
		return "order/details-see";
	}
    @RequestMapping("order_send")
  	public @ResponseBody jsonInfo order_send(Integer id) {
    	if(service.order_send(id)>0) {
    		return new jsonInfo(1, "");
    	}else {
    		return new jsonInfo(0, "");
    		}
    	}
    
}
