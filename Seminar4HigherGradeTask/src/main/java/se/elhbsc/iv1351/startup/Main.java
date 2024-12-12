package se.elhbsc.iv1351.startup;

import se.elhbsc.iv1351.controller.Controller;
import se.elhbsc.iv1351.integration.ExternalDatabaseSystemDAO;
import se.elhbsc.iv1351.integration.ExternalDatabaseSystemException;
import se.elhbsc.iv1351.view.View;

public class Main {
	public static void main(String[] args) throws ExternalDatabaseSystemException {
		ExternalDatabaseSystemDAO dbSystem = new ExternalDatabaseSystemDAO();
		Controller contr = new Controller(dbSystem);
		View view = new View(contr);
		view.displayMenu();
	}
}
