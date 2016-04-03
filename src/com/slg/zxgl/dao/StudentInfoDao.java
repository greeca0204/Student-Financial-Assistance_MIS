package com.slg.zxgl.dao;

import java.util.List;
import java.util.Map;

import com.slg.zxgl.entity.PoorStudentInfo;
import com.slg.zxgl.entity.Student;
import com.slg.zxgl.entity.StudentInfo;

public interface StudentInfoDao {
	public List<StudentInfo> getAllStudents();

	public List<StudentInfo> getStudentsByWord(String word);

	public Map<Integer, StudentInfo> getMapStudents();

	public List<PoorStudentInfo> getPoorstusByWord(String word);

	public StudentInfo getStudentById(int stuid);

	public List<StudentInfo> getNotPoorByWord(String word);

	public List<StudentInfo> getAllNotPoor();

	public PoorStudentInfo getPoorstusByStuId(int stuid);

	public boolean addStu(Student stu);

	public List<Student> getStusByWord(String word);

	public boolean deleteStu(int stuid);

	public Student getStudent(int stuid);

	public boolean updateStu(Student stu);
}
