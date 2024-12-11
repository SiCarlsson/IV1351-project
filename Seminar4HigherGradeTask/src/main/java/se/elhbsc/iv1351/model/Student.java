package se.elhbsc.iv1351.model;

public class Student {
  private String name;
  private int studentId;
  private int activeRentals;

  /**
   * Constructor
   * 
   * @param studentDTO retrieved from the integration layer
   */
  public Student(StudentDTO studentDTO) {
    this.name = studentDTO.getName();
    this.studentId = studentDTO.getStudentId();
    this.activeRentals = studentDTO.getActiveRentals();
  }

  public boolean eligibleForRental(int maximumCurrentRentals) {
    if (this.activeRentals < maximumCurrentRentals) {
      return true;
    } else {
      return false;
    }
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
