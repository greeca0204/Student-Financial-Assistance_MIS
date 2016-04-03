package com.slg.zxgl.entity;

public class JobApplication {
	private ApplicationInfo app;
	private Job job;
	private StudentInfo stu;
	private Poorinfo poor;
	
	public JobApplication(ApplicationInfo app, Job job, StudentInfo stu, Poorinfo poor) {
		super();
		this.app = app;
		this.job = job;
		this.stu = stu;
		this.setPoor(poor);
	}

	public String getAppName() {
		return app.getName();
	}

	public String getStuName() {
		return stu.getName();
	}

	public String getStuAccname(){
		return stu.getAccname();
	}
	public boolean isCheck(){
		if(app.getCheck()==0){
			return false;
		}
		else{
			return true;
		}
	}
	
	public String getStatus() {
		if (app.getCheck() == 1) {
			return "ÉóºËÍ¨¹ý";
		} else if (app.getCheck() == 2) {
			return "ÉóºËÎ´Í¨¹ý";
		}
		return "Î´ÉóºË";
	}

	public String getStuGender(){
		if("M".equals(stu.getGender())){
			return "ÄÐ";
		}else{
			return "Å®";
		}
	}
	public String getStuPhone(){
		return stu.getPhone();
	}
	public String getStuCollegename(){
		return stu.getCollegename();
	}
	public String getStuGradename(){
		return stu.getGradename();
	}
	public String getStuMajorname(){
		return stu.getMajorname();
	}
	public String getShipName(){
		return app.getName();
	}
	public int getAppId(){
		return app.getId();
	}
	public String getStuClassName(){
		stu.getCollegename();
		stu.getGradename();
		stu.getMajorname();
		return stu.getClassname();
	}
	public String getStuAddress(){
		return stu.getAddress();
	}
	public String getStuIdentification(){
		return stu.getIdentification();
	}
	public String getStuNationality(){
		return stu.getNationality();
	}
	public String getStuPoliticsStatus(){
		stu.getNationality();
		return stu.getPoliticsStatus();
	}
	public int getShipId(){
		return app.getId();
	}
	public String getJobName(){
		return job.getName();
	}
	public String getJobWorkPoint(){
		return job.getWorkpoint();
	}
	public String getJobWorkTime(){
		return job.getWorktime();
	}
	public int getJobAllNumber(){
		return job.getAllNumber();
	}
	public String getJobEmplyer(){
		return job.getEmplyer();
	}
	public String getJobSkills(){
		return job.getSkills();
	}
	public String getJobInterview(){
		return job.getInterview();
	}

	public Poorinfo getPoor() {
		return poor;
	}

	public void setPoor(Poorinfo poor) {
		this.poor = poor;
	}
}
