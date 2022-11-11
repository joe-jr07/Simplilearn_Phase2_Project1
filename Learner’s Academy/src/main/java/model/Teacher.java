package model;

public class Teacher {
	private int id;
	private String name;
	private String designation;
	private int experience;
	
	public Teacher() {
	}
	
	public Teacher(int id, String name, String designation, int experience) {
		this.id = id;
		this.name = name;
		this.designation = designation;
		this.experience = experience;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", name=" + name + ", designation=" + designation + ", experience=" + experience
				+ "]";
	}
	
	
}
