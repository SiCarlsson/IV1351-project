package se.elhbsc.iv1351.integration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ExternalDatabaseSystemDAO {
  private static final String URL = "jdbc:postgresql://localhost:5432/SMS";
  private static final String USER = "postgres";
  private static final String PASSWORD = "Odelagd47";
  private Connection connection;

  public ExternalDatabaseSystemDAO() {
    try {
      this.connection = createDatabaseConnection();
      System.out.println("Connection established!");
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
    }
  }

  public Connection createDatabaseConnection() throws SQLException, ClassNotFoundException {
    try {
      Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
      throw new ClassNotFoundException("PostgreSQL JDBC Driver not found", e);
    }

    try {
      return DriverManager.getConnection(URL, USER, PASSWORD);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      throw new SQLException("Connection could not be established to PostgreSQL");
    }
  }
}
