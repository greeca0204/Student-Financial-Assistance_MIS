package com.slg.zxgl.dao;

import java.util.List;

import com.slg.zxgl.entity.Manager;
import com.slg.zxgl.entity.Student;
import com.slg.zxgl.entity.User;

public interface UserDao {
	public User getUserByNamePass(String accname, int userType);

	public boolean updateUserName(User user, String name);

	public boolean updateUserPassword(User user, String newpwd);

	public List<Manager> getAllAdmins(String word);

	public List<Student> getAllStusByWord(String word);

	public Student getAllStusById(int stuid);

	public String getUserNameById(int id);

	public boolean addManager(Manager m);

	public boolean deleteAdmin(int id);

	public Manager getAdminById(int id);

	public boolean updateAdmin(Manager m);
}
