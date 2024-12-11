package se.elhbsc.iv1351.controller;

import java.util.List;

import se.elhbsc.iv1351.integration.ExternalDatabaseSystemDAO;
import se.elhbsc.iv1351.model.InstrumentDTO;
import se.elhbsc.iv1351.model.Rental;
import se.elhbsc.iv1351.model.Student;
import se.elhbsc.iv1351.model.StudentDTO;

public class Controller {
  private Student student;
  private ExternalDatabaseSystemDAO dbSystem;
  private Rental rental;

  /**
   * Constructor
   * 
   * @param externalDatabaseSystemDAO Instance of object ExternalDatabaseSystemDAO
   */
  public Controller(ExternalDatabaseSystemDAO externalDatabaseSystemDAO) {
    this.student = null;
    this.dbSystem = externalDatabaseSystemDAO;
    this.rental = new Rental(dbSystem.findRentalLimits());
  }

  /**
   * Fetches students from database and validates only if the studentId exists
   * 
   * @param studentId
   */
  public void validateStudentId(int studentId) {
    StudentDTO placeholderStudentDTO = this.dbSystem.findStudentWithId(studentId);

    if (placeholderStudentDTO.getStudentId() > 0 && placeholderStudentDTO.getName() != "") {
      this.student = new Student(placeholderStudentDTO);
      this.student.setActiveRentals(this.dbSystem.findActiveLeasesByStudentId(studentId));
    }
  }

  /**
   * Collects all instruments from the database and returns it to view
   * 
   * @return A list of all available instrumentDTOs
   */
  public List<InstrumentDTO> retrieveAllAvailableInstruments() {
    return this.dbSystem.findAllAvailableInstruments();
  }

  /**
   * Verifies that a user is eligible for more rentals
   * @return True if the user is allowed to rent another instrument, else false
   */
  public boolean checkEligibleForRental() {
    if (this.student.eligibleForRental(this.rental.getMaximumActiveLeases())) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * Getter function to retrieve the logged in user
   * @return Currently logged in user
   */
  public Student getStudent() {
    return this.student;
  }

  /**
   * Setter function to nullify the logged in user (log out)
   */
  public void setStudentNull() {
    this.student = null;
  }
}
