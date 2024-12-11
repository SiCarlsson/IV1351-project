package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/SMS"; // Byt ut mydatabase mot ert databasnamn
    private static final String USER = "postgres";
    private static final String PASSWORD = "hej123"; // Välj era egna lösenord!

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver"); // Ladda JDBC-drivern
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL JDBC Driver not found!", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

}
