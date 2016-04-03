package com.slg.zxgl.dao;

import com.slg.zxgl.entity.Poorinfo;

public interface PoorinfoDao {
	public Poorinfo getPoorinfoById(int id);
	public boolean addPoorinfo(Poorinfo info);
	public boolean updatePoorinfo(Poorinfo info);
	public boolean deletePoorinfo(int stuid);
}
