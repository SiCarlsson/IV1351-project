package se.elhbsc.iv1351.controller;

import java.util.List;

import se.elhbsc.iv1351.integration.ExternalDatabaseSystemDAO;
import se.elhbsc.iv1351.model.InstrumentDTO;
import se.elhbsc.iv1351.model.Student;
import se.elhbsc.iv1351.model.StudentDTO;

public class Controller {
  private Student student;
  private ExternalDatabaseSystemDAO dbSystem;

  /**
   * Constructor
   * 
   * @param externalDatabaseSystemDAO Instance of object ExternalDatabaseSystemDAO
   */
  public Controller(ExternalDatabaseSystemDAO externalDatabaseSystemDAO) {
    this.student = null;
    this.dbSystem = externalDatabaseSystemDAO;
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

  public Student getStudent() {
    return this.student;
  }

  public void setStudentNull() {
    this.student = null;
  }

}
