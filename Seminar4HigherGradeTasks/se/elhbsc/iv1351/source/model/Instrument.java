package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Instrument {
    public List<String> listAvailableInstruments(String kind) {
        List<String> instruments = new ArrayList<>();
        String query = "SELECT brand, price FROM instruments WHERE kind = ? AND available = TRUE";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, kind);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String brand = rs.getString("brand");
                double price = rs.getDouble("price");
                instruments.add(brand + " - $" + price);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return instruments;
    }
}
