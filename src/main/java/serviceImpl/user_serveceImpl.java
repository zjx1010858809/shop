package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.user_dao;
import entity.user;
import jsonInfo.searchInfo;
import service.user_service;
@Service
public class user_serveceImpl implements user_service{
	@Autowired
	user_dao dao;

	public List<user> selectAll() {
		return dao.selectAll();
	}

	public List<user> select(searchInfo info) {
		return dao.select(info);
	}
	
	public void update_off(Integer id) {
		dao.update_off(id);
	}

	public void update_on(Integer id) {
		dao.update_on(id);
	}

	public List<user> byId(int id) {
		return dao.byId(id);
	}

	public void updatepass(user ad) {
		dao.updatepass(ad);
	}

	
	
	

}
