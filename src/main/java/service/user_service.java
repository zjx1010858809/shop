package service;

import java.util.List;

import entity.user;
import jsonInfo.searchInfo;

public interface user_service {
	public List<user> selectAll();
	public List<user> select(searchInfo info);
	public void update_off(Integer id);	
	public void update_on(Integer id);
	public List<user> byId(int id);
	public int urepass(int id);
}
