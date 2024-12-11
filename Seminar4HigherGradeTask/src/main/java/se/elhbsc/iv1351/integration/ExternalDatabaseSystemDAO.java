package se.elhbsc.iv1351.integration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import se.elhbsc.iv1351.model.StudentDTO;

public class ExternalDatabaseSystemDAO {
  private static final String URL = "jdbc:postgresql://localhost:5432/SMS";
  private static final String USER = "postgres";
  private static final String PASSWORD = "Odelagd47";

  private Connection connection;
  private PreparedStatement findStudentWithId;

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
  private void commit() throws SQLException {
    try {
      this.connection.commit();
    } catch (SQLException e) {
      throw new SQLException("Could not commit");
    }
  }

  public StudentDTO findStudentWithId(int studentId) {
    ResultSet resultSet = null;
    StudentDTO fetchedStudent = new StudentDTO("", 0);
    
    try {
      findStudentWithId.setInt(1, studentId);

      resultSet = findStudentWithId.executeQuery();

      if (resultSet.next()) {
        int id = resultSet.getInt("id");
        String studentName = resultSet.getString("student_name");
        fetchedStudent = new StudentDTO(studentName, id);
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

  public void prepareStatements() throws SQLException {
    findStudentWithId = this.connection
        .prepareStatement(
            "SELECT student.id, CONCAT (person.first_name, ' ', person.last_name) AS student_name FROM student LEFT JOIN person ON person.id = person_id WHERE student.id = ?");
  }
}
