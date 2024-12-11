package se.elhbsc.iv1351.model;

public class StudentDTO {
  private String name;
  private int studentId;

  /**
   * Constructor
   * 
   * @param name Name of the current student
   * @param studentId Id of the current student
   */
  public StudentDTO(String name, int studentId) {
    this.name = name;
    this.studentId = studentId;
  }

  /**
   * Get function to retrieve the students name
   * 
   * @return objects name
   */
  public String getName() {
    return this.name;
  }

  /**
   * Get function to retrieve the student id
   * 
   * @return objects student id
   */
  public int getStudentId() {
    return this.studentId;
  }
}
