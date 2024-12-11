package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.integration;

import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.model.InstrumentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InstrumentDAO {
    private Connection connection;

    public InstrumentDAO(Connection connection) {
        this.connection = connection;
    }

    public List<InstrumentDTO> findAvailableInstruments(String kind) throws Exception {
        
        String query = "SELECT il.type_of_instrument AS instrument_type, " +
                   "isr.instrument_brand AS brand, ips.fee_per_month AS price " +
                   "FROM instrumental_storage isr " +
                   "JOIN instrumental_price_scheme ips ON ips.type_of_instrument = isr.instrument_brand " +
                   "LEFT JOIN instrumental_lease il ON il.instrumental_storage_id = isr.id " +
                   "WHERE il.end_date < CURRENT_DATE OR il.end_date IS NULL " +
                   "ORDER BY CASE WHEN ? = 'type' THEN il.type_of_instrument END ASC";
        List<InstrumentDTO> instruments = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, kind);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    instruments.add(new InstrumentDTO(
                        rs.getString("instrument_type"),
                        rs.getString("brand"),
                        rs.getDouble("price")
                    ));
                }
            }
        }
        return instruments;
    }
}
