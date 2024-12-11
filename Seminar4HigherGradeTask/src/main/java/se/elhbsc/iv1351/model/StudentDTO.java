package se.elhbsc.iv1351.model;

public class StudentDTO {
  private String name;
  private int studentId;
  private int activeRentals;

  public StudentDTO(String name, int studentId, int activeRentals) {
    this.name = name;
    this.studentId = studentId;
    this.activeRentals = activeRentals;
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

  /**
   * Get function to retrieve the active rentals
   * 
   * @return objects active rental amount
   */
  public int getActiveRentals() {
    return this.activeRentals;
  }
}
