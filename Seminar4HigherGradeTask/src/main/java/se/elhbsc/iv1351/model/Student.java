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
  }

  /**
   * Check if the user has too many rentals or not
   * 
   * @param maximumCurrentRentals Maximum allowed rentals
   * @return True if eligible for more rentals, else false
   */
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

  /**
   * Setter method to specify active rentals
   * 
   * @param activeRentals Number of currrently active rentals
   */
  public void setActiveRentals(int activeRentals) {
    this.activeRentals = activeRentals;
  }
}
