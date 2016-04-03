package com.slg.zxgl.db;

import com.slg.zxgl.dao.impl.AdminLogDaoImpl;
import com.slg.zxgl.entity.AdminLog;

public class AdminLogUtil {
	public static void logAdminOperation(int adminid,String operation){
		new AdminLogDaoImpl().addLog(new AdminLog(adminid, operation));
	}
}
