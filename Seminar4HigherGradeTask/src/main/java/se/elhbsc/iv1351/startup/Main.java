package se.elhbsc.iv1351.startup;

import se.elhbsc.iv1351.controller.Controller;
import se.elhbsc.iv1351.view.View;

/**
 * Hello world!
 */
public class Main {
	public static void main(String[] args) {
		Controller contr = new Controller();
		View view = new View(contr);
		view.displayMenu();
	}
}
