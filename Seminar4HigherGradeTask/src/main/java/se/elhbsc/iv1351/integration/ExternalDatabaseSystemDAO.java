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

  public ExternalDatabaseSystemDAO() {
    try {
      createDatabaseConnection();
      prepareStatements();
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
    }
  }

  private void createDatabaseConnection() throws SQLException, ClassNotFoundException {
    try {
      Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
      throw new ClassNotFoundException("PostgreSQL JDBC Driver not found", e);
    }

    try {
      this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
    } catch (SQLException e) {
      throw new SQLException("Connection could not be established to PostgreSQL");
    }
  }

  /**
   * Method to commit the database
   * 
   * @throws SQLException If not possible to commit
   */
  // private void commit() throws SQLException {
  // try {
  // this.connection.commit();
  // } catch (SQLException e) {
  // throw new SQLException("Could not commit");
  // }
  // }

  public StudentDTO findStudentWithId(int studentId) {
    ResultSet resultSet = null;
    StudentDTO fetchedStudent = new StudentDTO("", 0, 0);

    try {
      findStudentWithId.setInt(1, studentId);

      resultSet = findStudentWithId.executeQuery();

      if (resultSet.next()) {
        int id = resultSet.getInt("id");
        String studentName = resultSet.getString("student_name");
        int activeLeases = resultSet.getInt("lease_count");
        fetchedStudent = new StudentDTO(studentName, id, activeLeases);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (resultSet != null) {
          resultSet.close();
        }
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    return fetchedStudent;
  }

  /**
   * Method fetches all available instruments in the database
   * 
   * @return A list of all available instrumentDTOs
   */
  public List<InstrumentDTO> findAllAvailableInstruments() {
    List<InstrumentDTO> instruments = new ArrayList<>();
    try (ResultSet resultSet = findAllAvailableInstruments.executeQuery()) {
      while (resultSet.next()) {
        int instrumentId = resultSet.getInt("id");
        String instrumentBrand = resultSet.getString("instrument_brand");
        String instrumentPrice = resultSet.getString("fee_per_month");
        String instrumentType = resultSet.getString("type_of_instrument");

        instruments.add(new InstrumentDTO(instrumentType, instrumentBrand, instrumentPrice, instrumentId));
      }
    } catch (SQLException e) {
      System.err.println("Error fetching available instruments: " + e.getMessage());
    }
    return instruments;
  }

  /**
   * Method fetches the rental limits from the database
   * 
   * @return a rental DTO with the limits
   */
  public RentalDTO findRentalLimits() {
    ResultSet resultSet = null;

    try {
      resultSet = findRentalLimits.executeQuery();
      if (resultSet.next()) {
        int maximumActiveLeases = Integer.parseInt(resultSet.getString("maximum_number_of_active_leases"));
        int maximumRentalMonths = Integer.parseInt(resultSet.getString("maximum_number_of_months"));
        return new RentalDTO(maximumActiveLeases, maximumRentalMonths);
      }
    } catch (SQLException e) {
      System.err.println("Could not fetch rental limits: " + e.getMessage());
    }

    return null;
  }

  private void prepareStatements() throws SQLException {
    findStudentWithId = this.connection
        .prepareStatement(
            "SELECT student.id, CONCAT(person.first_name, ' ', person.last_name) AS student_name, COUNT(instrumental_lease.id) AS lease_count FROM public.student LEFT JOIN public.person ON person.id = student.person_id LEFT JOIN public.instrumental_lease ON student.id = instrumental_lease.student_id AND instrumental_lease.start_date >= NOW() - INTERVAL '1 year' WHERE student.id = ? GROUP BY student.id, person.last_name, person.first_name");

    findAllAvailableInstruments = this.connection
        .prepareStatement(
            "SELECT instrumental_storage.id, type_of_instrument, instrument_brand, fee_per_month FROM instrumental_storage LEFT JOIN instrumental_price_scheme ON instrumental_price_scheme.id = instrumental_price_scheme_id LEFT JOIN instrumental_lease ON instrumental_storage.id = instrumental_storage_id WHERE student_id IS NULL ORDER BY type_of_instrument");

    findRentalLimits = this.connection.prepareStatement(
        "SELECT maximum_number_of_active_leases, maximum_number_of_months FROM instrumental_lease_rules");
  }
}
