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
  private PreparedStatement findNumberOfActiveLeasesByStudentId;
  private PreparedStatement findLatestRentalRulesId;
  private PreparedStatement createNewRental;
  private PreparedStatement findAllActiveLeasesWithStudentId;
  private PreparedStatement deleteActiveRental;

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
  public int findNumberOfActiveLeasesByStudentId(int studentId) throws ExternalDatabaseSystemException {
    ResultSet resultSet = null;
    String failMessage = "Could not fetch all active leases.";

    try {
      findNumberOfActiveLeasesByStudentId.setInt(1, studentId);
      resultSet = findNumberOfActiveLeasesByStudentId.executeQuery();

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
   * Fetches the latest rules regarding renting from database
   * 
   * @return The ID of the latest rule
   * @throws ExternalDatabaseSystemException
   */
  private int findLatestRentalRulesId() throws ExternalDatabaseSystemException {
    ResultSet resultSet = null;
    String failMessage = "Could not fetch latest rental rules.";

    try {
      resultSet = findLatestRentalRulesId.executeQuery();

      if (resultSet.next()) {
        return resultSet.getInt("id");
      }
    } catch (Exception e) {
      handleException(failMessage, e);
    } finally {
      closeResultSet(resultSet, failMessage);
    }
    return 1; // Default
  }

  /**
   * Method to insert a new rental to the database
   * 
   * @param studentId    Logged in student ID
   * @param instrumentId Chosen instrument ID to rent
   * @throws ExternalDatabaseSystemException If there occurs and SQL error
   */
  public void createNewRental(int studentId, int instrumentId) throws ExternalDatabaseSystemException {
    int latestRentalRulesId = findLatestRentalRulesId();

    ResultSet resultSet = null;
    String failMessage = "Could not create a new rental.";
    int updatedRows = 0;

    try {
      createNewRental.setInt(1, studentId);
      createNewRental.setInt(2, instrumentId);
      createNewRental.setInt(3, latestRentalRulesId);
      updatedRows = createNewRental.executeUpdate();

      if (updatedRows != 1) {
        handleException(failMessage, null);
      }

      commit();

    } catch (Exception e) {
      handleException(failMessage, e);
    } finally {
      closeResultSet(resultSet, failMessage);
    }
  }

  /**
   * Method to fetch all active leases and necessary information
   * 
   * @param studentId currently logged in user id
   * @return list of all active rentals
   * @throws ExternalDatabaseSystemException If an error occured while fetching
   *                                         the data
   */
  public List<InstrumentDTO> findAllActiveLeasesWithStudentId(int studentId) throws ExternalDatabaseSystemException {
    List<InstrumentDTO> activeLeases = new ArrayList<>();
    ResultSet resultSet = null;
    String failMessage = "Could not fetch students instrumental leases.";

    try {
      findAllActiveLeasesWithStudentId.setInt(1, studentId);
      resultSet = findAllActiveLeasesWithStudentId.executeQuery();

      while (resultSet.next()) {
        int instrumentId = resultSet.getInt("id");
        String instrumentBrand = resultSet.getString("instrument_brand");
        String instrumentType = resultSet.getString("type_of_instrument");
        String startDate = resultSet.getString("start_date");
        String endDate = resultSet.getString("end_date");

        activeLeases.add(new InstrumentDTO(instrumentType, instrumentBrand, instrumentId, startDate, endDate));
      }

      return activeLeases;
    } catch (Exception e) {
      handleException(failMessage, e);
    } finally {
      closeResultSet(resultSet, failMessage);
    }
    return activeLeases; // Default empty
  }

  public void deleteActiveRental(int instrumentId) throws ExternalDatabaseSystemException {
    String failMessage = "Could not terminate rental agreement.";
    int updatedRows = 0;

    try {
      deleteActiveRental.setInt(1, instrumentId);

      updatedRows = deleteActiveRental.executeUpdate();

      commit();
    } catch (Exception e) {
      handleException(failMessage, e);
    } finally {
      closeResultSet(null, failMessage);
    }
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
            "SELECT instrumental_storage.id, type_of_instrument, instrument_brand, fee_per_month, latest_lease.end_date\n"
                + //
                "FROM instrumental_storage\n" + //
                "LEFT JOIN (\n" + //
                "\tSELECT instrumental_storage_id, MAX(end_date) AS end_date\n" + //
                "\tFROM public.instrumental_lease\n" + //
                "\tGROUP BY instrumental_storage_id\n" + //
                ") AS latest_lease ON instrumental_storage.id = latest_lease.instrumental_storage_id\n" + //
                "LEFT JOIN instrumental_price_scheme ON instrumental_price_scheme.id = instrumental_price_scheme_id\n" + //
                "WHERE latest_lease.end_date IS NULL OR latest_lease.end_date <= CURRENT_DATE\n" + //
                "GROUP BY instrumental_storage.id, type_of_instrument, instrument_brand, fee_per_month, latest_lease.end_date\n"
                + //
                "ORDER BY type_of_instrument");

    findRentalLimits = this.connection.prepareStatement(
        "SELECT maximum_number_of_active_leases, maximum_number_of_months FROM instrumental_lease_rules");

    findNumberOfActiveLeasesByStudentId = this.connection.prepareStatement(
        "SELECT student.id, COUNT(instrumental_lease.id) AS lease_count FROM public.student LEFT JOIN public.person ON person.id = student.person_id LEFT JOIN public.instrumental_lease ON student.id = instrumental_lease.student_id AND instrumental_lease.end_date > NOW() WHERE student_id = ? GROUP BY student.id");

    findLatestRentalRulesId = this.connection
        .prepareStatement("SELECT id FROM instrumental_lease_rules ORDER BY rules_from_date DESC LIMIT 1");

    createNewRental = this.connection.prepareStatement(
        "INSERT INTO instrumental_lease (start_date, end_date, student_id, instrumental_storage_id, instrumental_lease_rules_id)\n"
            + //
            "VALUES (NOW(), NOW() + INTERVAL '1 year', ?, ?, ?);");

    findAllActiveLeasesWithStudentId = this.connection
        .prepareStatement(
            "SELECT instrumental_storage.id, start_date, end_date, instrument_brand, type_of_instrument FROM instrumental_lease LEFT JOIN instrumental_storage ON instrumental_storage.id = instrumental_storage_id WHERE student_id = ? AND (NOW() < end_date)");

    deleteActiveRental = this.connection
        .prepareStatement("UPDATE instrumental_lease SET end_date = NOW() WHERE instrumental_storage_id = ?");
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
      throw new ExternalDatabaseSystemException(fullFailMessage, exception);
    } else {
      throw new ExternalDatabaseSystemException(failMessage);
    }
  }
}
