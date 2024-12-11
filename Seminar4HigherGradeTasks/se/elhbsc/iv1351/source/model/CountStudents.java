
package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CountStudents {
    public static void main(String[] args) {
        String query = "SELECT COUNT(*) AS total FROM student";

        try (Connection connection = DatabaseConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            if (resultSet.next()) {
                int totalStudents = resultSet.getInt("total");
                System.out.println("Antal studenter i tabellen 'student': " + totalStudents);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

