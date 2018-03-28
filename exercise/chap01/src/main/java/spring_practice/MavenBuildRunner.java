package spring_practice;

import java.util.List;

public class MavenBuildRunner implements BuildRunner {
	
	private String mavenPath;
	
	public void setMavenPath(String mavenPath) {
		this.mavenPath = mavenPath;
	}
	
	@Override
	public void bulid(List<String> srcDirs, String binDir) {
		String pathInfo = "Maven path: " + mavenPath + "\n";
		
		for (String srcDir : srcDirs)
			pathInfo += "Src path: " + srcDir + "\n";
		
		pathInfo += "Class path: " + binDir + "\n";
		
		System.out.println("BuildRunner worked\n" + pathInfo);
	}	
	
}
