package spring_practice;

import java.util.List;

public class Project {
	
	private List<String> srcDirs;
	private String binDir;		
	
	public void setSrcDirs(List<String> srcDirs) {
		this.srcDirs = srcDirs;
	}
	
	public void setBinDir(String binDir) {
		this.binDir = binDir;
	}
	
	
	private BuildRunner buildRunner;
	
	public void setBuildRunner(BuildRunner buildRunner) {
		this.buildRunner = buildRunner;
	}
	
	public void build() {
		buildRunner.bulid(srcDirs, binDir);
	}
}
