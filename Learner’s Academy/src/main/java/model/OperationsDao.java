package model;

import java.util.List;

public interface OperationsDao {
	int addClasses(Classes classes);
	int addStudent(Student student);
	int addSubject(Subject subject);
	int addTeacher(Teacher teacher);
	
}
