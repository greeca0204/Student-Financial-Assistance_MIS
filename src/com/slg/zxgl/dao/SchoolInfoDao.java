package com.slg.zxgl.dao;

import java.util.List;
import java.util.Map;

import com.slg.zxgl.entity.ClassInfo;
import com.slg.zxgl.entity.CollegeInfo;
import com.slg.zxgl.entity.GradeInfo;
import com.slg.zxgl.entity.GrantShip;
import com.slg.zxgl.entity.MajorInfo;
import com.slg.zxgl.entity.ScholarShip;
import com.slg.zxgl.entity.ScholarShipApplication;

public interface SchoolInfoDao {
	public String getClassNameBy(int classid);

	public ClassInfo getClassInfoById(int id);

	public List<ClassInfo> getClasss(String word);

	public List<CollegeInfo> getColleges(String word);

	public List<MajorInfo> getMajors(String word);

	public List<GradeInfo> getGrades(String word);

	public CollegeInfo getCollegeInfoById(int id);

	public MajorInfo getMajorInfoById(int id);

	public GradeInfo getGradeInfoById(int id);

	public List<GrantShip> getGrantShips(String word);

	public GrantShip getGrantShipById(int id);

	public ScholarShip getScholarShipById(int id);

	public List<ScholarShip> getScholarShips();

	public List<ScholarShipApplication> getScholarShipApplications();

	public boolean addGrantShip(GrantShip ship);

	public boolean deleteGrantShip(int shipid);

	public boolean updateGrantShip(GrantShip ship);

	public Map<Integer, String> getClassNameId();

	public Map<Integer, String> getTeaNameId();

	public Map<Integer, String> getStuNameId();

	public boolean addCollegeInfo(CollegeInfo info);

	public boolean deleteCollege(int collegeid);

	public boolean updateCollegeInfo(CollegeInfo info);

	public boolean addGradeInfo(GradeInfo info);

	public boolean deleteGrade(int gradeid);

	public boolean updateGradeInfo(GradeInfo info);

	public boolean addMajorInfo(MajorInfo info);

	public boolean deleteMajorInfo(int majorid);

	public boolean updateMajorInfo(MajorInfo info);

	public Map<Integer, String> getCollegeNameId();

	public Map<Integer, String> getGradeNameId();

	public Map<Integer, String> getMajorNameId();

	public boolean addClassInfo(ClassInfo info);

	public boolean updateClassInfo(ClassInfo info);

	public boolean deleteClass(int id);

}
