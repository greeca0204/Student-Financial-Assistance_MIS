package com.slg.zxgl.dao;

import java.util.List;

import com.slg.zxgl.entity.Teacher;

public interface TeacherDao {
	public List<Teacher> getTeachersByWord(String word);

	public boolean addTea(Teacher tea);

	public Teacher getTeacherById(int id);

	public boolean updateTeacher(Teacher tea);

	public boolean deleteTeacher(int id);
}
