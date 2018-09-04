package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.user;
import jsonInfo.searchInfo;

@Repository
public interface user_dao {
	@Select("select * from user")
	public List<user> selectAll();
    @Select("select * from user ${where} ${limit}")
	public List<user> select(searchInfo info);
	@Update("update user set status=1 where id=#{id}")
    public void update_off(Integer id);	
	@Update("update user set status=0 where id=#{id}")
    public void update_on(Integer id);
	@Select("select * from user where id=#{id}")
	public List<user> byId(int id);
	@Update("update user set password='202CB962AC59075B964B07152D234B70' where id=#{id}")
	public int urepass(int id);
}
