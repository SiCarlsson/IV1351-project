package se.elhbsc.iv1351.integration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import se.elhbsc.iv1351.model.InstrumentDTO;
import se.elhbsc.iv1351.model.RentalDTO;
import se.elhbsc.iv1351.model.StudentDTO;

public class ExternalDatabaseSystemDAO {
  private static final String URL = "jdbc:postgresql://localhost:5432/SMS";
  private static final String USER = "postgres";
  private static final String PASSWORD = "Odelagd47";

  private Connection connection;
  private PreparedStatement findStudentWithId;
  private PreparedStatement findAllAvailableInstruments;
  private PreparedStatement findRentalLimits;
  private PreparedStatement findActiveLeasesByStudentId;

  /**
   * Constructor
   * 
   * @throws ExternalDatabaseSystemException If an error occured while connecting
   *                                         to the database
   */
  public ExternalDatabaseSystemDAO() throws ExternalDatabaseSystemException {
    try {
      createDatabaseConnection();
      prepareStatements();
    } catch (ClassNotFoundException | SQLException e) {
      throw new ExternalDatabaseSystemException("Could not connect to database", e);
    }
  }

  /**
   * Establishes the database connection
   * 
   * @throws SQLException           If there occurs an error with SQL
   * @throws ClassNotFoundException If the required driver is not found
   */
  private void createDatabaseConnection() throws SQLException, ClassNotFoundException {
    try {
      Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
      throw new ClassNotFoundException("PostgreSQL JDBC Driver not found", e);
    }

    try {
      this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
      this.connection.setAutoCommit(false);
    } catch (SQLException e) {
      throw new SQLException("Connection could not be established to PostgreSQL");
    }
  }

  /**
   * Method to commit the database
   * 
   * @throws ExternalDatabaseSystemException If not possible to commit / problem
   *                                         with SQL
   */
  private void commit() throws ExternalDatabaseSystemException {
    String failMessage = "Could not commit to the database.";
    try {
      this.connection.commit();
    } catch (SQLException e) {
      handleException(failMessage, e);
    }
  }

  /**
   * Helper function to close the result set after fetching data
   * 
   * @param resultSet The currently used result set
   * @throws ExternalDatabaseSystemException If an error occured while closing the
   *                                         result set
   */
  private void closeResultSet(ResultSet resultSet, String failMessage) throws ExternalDatabaseSystemException {
    try {
      if (resultSet != null) {
        resultSet.close();
      }
    } catch (Exception e) {
      throw new ExternalDatabaseSystemException(failMessage, e);
    }
  }

  /**
   * Fetches student based on id
   * 
   * @param studentId the Id given by the user to log in
   * @return A studentDTO of the applicable user
   * @throws ExternalDatabaseSystemException If the database had any issues
   */
  public StudentDTO findStudentWithId(int studentId) throws ExternalDatabaseSystemException {
    ResultSet resultSet = null;
    StudentDTO fetchedStudent = new StudentDTO("", 0);
    String failMessage = "Could not fetch student with id.";

    try {
      findStudentWithId.setInt(1, studentId);

      resultSet = findStudentWithId.executeQuery();

      if (resultSet.next()) {
        int id = resultSet.getInt("id");
        String studentName = resultSet.getString("student_name");
        fetchedStudent = new StudentDTO(studentName, id);
      }
    } catch (SQLException e) {
      handleException(failMessage, e);
    } finally {
      closeResultSet(resultSet, failMessage);
    }
    return fetchedStudent;
  }

  /**
   * Method fetches all available instruments in the database
   * 
   * @return A list of all available instrumentDTOs
   * @throws ExternalDatabaseSystemException If there is any SQL related issues
   */
  public List<InstrumentDTO> findAllAvailableInstruments() throws ExternalDatabaseSystemException {
    ResultSet resultSet = null;
    List<InstrumentDTO> instruments = new ArrayList<>();
    String failMessage = "Error fetching available instruments.";

    try {
      resultSet = findAllAvailableInstruments.executeQuery();
      while (resultSet.next()) {
        int instrumentId = resultSet.getInt("id");
        String instrumentBrand = resultSet.getString("instrument_brand");
        String instrumentPrice = resultSet.getString("fee_per_month");
        String instrumentType = resultSet.getString("type_of_instrument");

        instruments.add(new InstrumentDTO(instrumentType, instrumentBrand, instrumentPrice, instrumentId));
      }
    } catch (SQLException e) {
      handleException(failMessage, e);
    } finally {
      closeResultSet(resultSet, failMessage);
    }
    return instruments;
  }

  /**
   * Method fetches the rental limits from the database
   * 
   * @return a rental DTO with the limits
   * @throws ExternalDatabaseSystemException If there is any SQL related issues
   */
  public RentalDTO findRentalLimits() throws ExternalDatabaseSystemException {
    ResultSet resultSet = null;
    String failMessage = "Could not fetch rental limits.";

    try {
      resultSet = findRentalLimits.executeQuery();
      if (resultSet.next()) {
        int maximumActiveLeases = Integer.parseInt(resultSet.getString("maximum_number_of_active_leases"));
        int maximumRentalMonths = Integer.parseInt(resultSet.getString("maximum_number_of_months"));
        return new RentalDTO(maximumActiveLeases, maximumRentalMonths);
      }
    } catch (SQLException e) {
      handleException(failMessage, e);
    } finally {
      closeResultSet(resultSet, failMessage);
    }

    return null;
  }

  /**
   * Fetches all active leases give a student id
   * 
   * @param studentId the student id of the logged in student
   * @return the number of active current leases
   * @throws ExternalDatabaseSystemException If there is any SQL related issues
   */
  public int findActiveLeasesByStudentId(int studentId) throws ExternalDatabaseSystemException {
    ResultSet resultSet = null;
    String failMessage = "Could not fetch all active leases.";

    try {
      findActiveLeasesByStudentId.setInt(1, studentId);
      resultSet = findActiveLeasesByStudentId.executeQuery();

      if (resultSet.next()) {
        return resultSet.getInt("lease_count");
      }
    } catch (Exception e) {
      handleException(failMessage, e);
    } finally {
      closeResultSet(resultSet, failMessage);
    }
    return 0;
  }

  /**
   * Prepares all SQL statements, called for in the constructor
   * 
   * @throws SQLException If there is any SQL related error when preparing the
   *                      queries
   */
  private void prepareStatements() throws SQLException {
    findStudentWithId = this.connection
        .prepareStatement(
            "SELECT student.id, CONCAT (person.first_name, ' ', person.last_name) AS student_name FROM student LEFT JOIN person ON person.id = person_id WHERE student.id = ?");

    findAllAvailableInstruments = this.connection
        .prepareStatement(
            "SELECT instrumental_storage.id, type_of_instrument, instrument_brand, fee_per_month FROM instrumental_storage LEFT JOIN instrumental_price_scheme ON instrumental_price_scheme.id = instrumental_price_scheme_id LEFT JOIN instrumental_lease ON instrumental_storage.id = instrumental_storage_id WHERE student_id IS NULL ORDER BY type_of_instrument");

    findRentalLimits = this.connection.prepareStatement(
        "SELECT maximum_number_of_active_leases, maximum_number_of_months FROM instrumental_lease_rules");

    findActiveLeasesByStudentId = this.connection.prepareStatement(
        "SELECT student.id, COUNT(instrumental_lease.id) AS lease_count FROM public.student LEFT JOIN public.person ON person.id = student.person_id LEFT JOIN public.instrumental_lease ON student.id = instrumental_lease.student_id AND instrumental_lease.end_date > NOW() WHERE student_id = ? GROUP BY student.id");
  }

  /**
   * Handles exceptions (inspiration gathered from jdbc-bank github page [Leif
   * Lindbäck])
   * 
   * @param failMessage The thrown error message
   * @param exception   The thrown error
   * @throws ExternalDatabaseSystemException Custom made exception
   */
  private void handleException(String failMessage, Exception exception) throws ExternalDatabaseSystemException {
    String fullFailMessage = failMessage;

    try {
      this.connection.rollback();
    } catch (SQLException e) {
      fullFailMessage += ". Also failed to complete rollback due to: " + e.getMessage();
    }

    if (exception != null) {
      throw new ExternalDatabaseSystemException(failMessage, exception);
    } else {
      throw new ExternalDatabaseSystemException(failMessage);
    }
  }
}
