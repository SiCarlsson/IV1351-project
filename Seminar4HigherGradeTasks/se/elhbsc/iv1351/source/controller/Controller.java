package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.controller;

import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.integration.InstrumentDAO;
import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.model.InstrumentDTO;
import java.sql.Connection;
import java.util.List;

public class Controller {
    private InstrumentDAO instrumentDAO;

    public Controller(Connection connection) {
        this.instrumentDAO = new InstrumentDAO(connection);
    }

    public List<InstrumentDTO> listAvailableInstruments(String sortBy) throws Exception {
        return instrumentDAO.findAvailableInstruments(sortBy);
    }
}
