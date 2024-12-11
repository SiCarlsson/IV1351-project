package se.elhbsc.iv1351.view;

import java.util.Scanner;

import se.elhbsc.iv1351.controller.Controller;
import se.elhbsc.iv1351.integration.ExternalDatabaseSystemDAO;

public class View {
	private Scanner inputScanner;
	private Controller contr;

	/**
	 * Constructor
	 * 
	 * @param contr instance of controller
	 */
	public View(Controller contr) {
		this.inputScanner = new Scanner(System.in);
		this.contr = contr;
	}

	private void displayMenuOptions(String[] options) {
		System.out.println("Chose an alternative... (integer)\n");
		for (int i = 0; i < options.length; i++) {
			System.out.println((i + 1) + ". " + options[i]);
		}
	}

	/**
	 * Contains all logic regarding the initial menu
	 */
	public void displayMenu() {
		clearTerminal();

		while (true) {
			String[] defaultAlternatives = { "Log in with Student-ID", "End program\n" };
			displayMenuOptions(defaultAlternatives);
			String input = this.inputScanner.nextLine();

			switch (input) {
				// Log in user
				case "1":
					logInStudent();
					break;

				// End program
				case "2":
					clearTerminal();
					this.inputScanner.close();
					System.out.println("Thanks for today!\n");
					System.exit(0);
					break;

				default:
					clearTerminal();
					System.out.println("No need to chose a valid integer number...\n");
			}
		}
	}

	/**
	 * Holds the logic of logging in a specific student
	 * 
	 * @throws Exception
	 */
	private void logInStudent() {
		clearTerminal();
		String goBackString = "[Choose 0 to go back to main menu]\n";
		while (true) {
			System.out.println("What is your Student-ID? Please specify... (integer)\n" + goBackString);
			String inputString = this.inputScanner.nextLine();

			int inputInteger = 0;
			try {
				inputInteger = Integer.parseInt(inputString);
				
				if (inputInteger == 0) {
					clearTerminal();
					break;
				}
			} catch (Exception e) {
				clearTerminal();
				System.err.println("You need to give a correct input (integer > 0)\n");
			}

			if (inputInteger > 0) {
				contr.validateStudentId(inputInteger);
				if (contr.getStudent() != null) {
					loggedInMenu();
				}
			} else {
				clearTerminal();
				System.err.println("You must chose an integer greater than 0 (> 0)\n");
			}
		}
	}

	/**
	 * Contains all logic regarding logged in menu
	 */
	private void loggedInMenu() {
		clearTerminal();
		String[] alternatives = { "List all available instuments", "Rent an instrument", "Terminate a rental",
				"Rules of renting", "Log out\n" };
		System.out.println("Welcome " + contr.getStudent().getName() + "\n");
		displayMenuOptions(alternatives);
		String input = this.inputScanner.nextLine();

		switch (input) {
			case "1":
				break;
			case "2":
				break;
			case "3":
				break;
			case "4":
				break;
			case "5":
				contr.setStudentNull();
				clearTerminal();
				break;
			default:
				break;
		}
	}

	/**
	 * Clears the terminal, only used for aesthetics
	 */
	private void clearTerminal() {
		System.out.print("\033[H\033[2J");
		System.out.flush();
	}
}