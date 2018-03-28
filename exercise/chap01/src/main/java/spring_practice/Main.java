package spring_practice;

import java.util.ArrayList;
import java.util.List;

public class Main {
	
	public static void main(String[] args) {		
		List<String> srcDirs = new ArrayList();		
		srcDirs.add("src");
		srcDirs.add("srcResources");	
		
		Project sampleProject = new Project();
		sampleProject.setStrcDirs(srcDirs);
		sampleProject.setBinDir("bin");
		
		MavenBuildRunner buildRunner = new MavenBuildRunner();
		buildRunner.setMavenPath("C:\\apache-maven-3.5.3");
		sampleProject.setBuildRunner(buildRunner);
		
		sampleProject.build();
	}
}
