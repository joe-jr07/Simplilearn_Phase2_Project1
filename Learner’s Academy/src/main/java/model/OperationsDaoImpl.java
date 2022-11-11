package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OperationsDaoImpl implements OperationsDao {
	
	public static Connection con;
	
	public static void initDatabase() throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver is loaded");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
			System.out.println("connection is establsihed");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int addClasses(Classes classes) {
		int res = -1;
		try {
			PreparedStatement pst = con.prepareStatement("insert into classes(classname) values(?)");
			pst.setString(1, classes.getName());
			res = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int addStudent(Student student) {
		int res = -1;
		try {
			PreparedStatement pst = con.prepareStatement("insert into students(name,age) values(?,?)");
			pst.setString(1, student.getName());
			pst.setInt(2, student.getAge());
			res = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int addSubject(Subject subject) {
		int res = -1;
		try {
			PreparedStatement pst = con.prepareStatement("insert into subjects(name) values(?)");
			pst.setString(1, subject.getName());
			res = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int addTeacher(Teacher teacher) {
		int res = -1;
		try {
			PreparedStatement pst = con.prepareStatement("insert into teachers(name,designation,experience) values(?,?,?)");
			pst.setString(1, teacher.getName());
			pst.setString(2, teacher.getDesignation());
			pst.setInt(3, teacher.getExperience());
			res = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	

}
