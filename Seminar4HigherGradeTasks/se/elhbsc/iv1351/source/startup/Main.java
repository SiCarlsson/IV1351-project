package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.startup;

import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.controller.Controller;
import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.view.View;
import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.model.DatabaseConnection;

import java.sql.Connection;

public class Main {
    public static void main(String[] args) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            Controller contr = new Controller(connection); // Skicka anslutningen till Controller
            View view = new View(contr);
            view.displayMenu();
        } catch (Exception e) {
            System.out.println("Failed to start the application: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
