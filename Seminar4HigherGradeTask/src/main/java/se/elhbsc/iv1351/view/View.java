package se.elhbsc.iv1351.view;

import java.util.Scanner;

import se.elhbsc.iv1351.controller.Controller;
import se.elhbsc.iv1351.integration.ExternalDatabaseSystemException;
import se.elhbsc.iv1351.model.InstrumentDTO;

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

	/**
	 * Method to display menu options in correct format
	 * 
	 * @param options An array of strings where each string is an option in the meny
	 */
	private void displayMenuOptions(String[] options) {
		System.out.println("Chose an alternative... (integer)\n");
		for (int i = 0; i < options.length; i++) {
			System.out.println((i + 1) + ". " + options[i]);
		}
	}

	/**
	 * Method prints message regarding error handling input in menu
	 */
	private void defaultMenuErrorMessage() {
		System.out.println("No need to chose a valid integer number...\n");
	}

	/**
	 * Contains all logic regarding the initial menu
	 * 
	 * @throws ExternalDatabaseSystemException If the data could not be fetched
	 */
	public void displayMenu() throws ExternalDatabaseSystemException {
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
					defaultMenuErrorMessage();
			}
		}
	}

	/**
	 * Holds the logic of logging in a specific student
	 * 
	 * @throws ExternalDatabaseSystemException If the data could not be fetched
	 * 
	 */
	private void logInStudent() throws ExternalDatabaseSystemException {
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
	 * 
	 * @throws ExternalDatabaseSystemException If the data could not be fetched
	 */
	private void loggedInMenu() throws ExternalDatabaseSystemException {
		clearTerminal();
		String[] alternatives = { "List all available instuments", "Rent an instrument", "Terminate a rental",
				"Rules of renting", "Log out\n" };
		System.out.println("Welcome " + this.contr.getStudent().getName() + "!\n");

		while (contr.getStudent() != null) {
			displayMenuOptions(alternatives);
			String input = this.inputScanner.nextLine();

			clearTerminal();
			switch (input) {
				case "1":
					listAllAvailableInstruments();
					promptEnterToContinue();
					clearTerminal();
					break;
				case "2":
					rentAnInstrument();
					clearTerminal();
					break;
				case "3":
					clearTerminal();
					System.out.println("Option 3 selected\n");
					break;
				case "4":
					clearTerminal();
					System.out.println("Option 4 selected\n");
					break;
				case "5":
					contr.setStudentNull();
					clearTerminal();
					break;
				default:
					clearTerminal();
					defaultMenuErrorMessage();
			}

		}
	}

	/**
	 * Prints all available instruments as a list for the user
	 * 
	 * @throws ExternalDatabaseSystemException If the data could not be fetched
	 */
	private void listAllAvailableInstruments() throws ExternalDatabaseSystemException {
		System.out.println("All available instruments:\n");

		System.out.println(String.format("%-15s %-20s %-15s %-10s", "Type", "Price (SEK/month)", "Brand", "ID"));
		System.out.println("------------------------------------------------------------");

		// Print each instrument as a row in the table
		for (InstrumentDTO instrument : contr.retrieveAllAvailableInstruments()) {
			System.out.println(String.format(
					"%-15s %-20s %-15s %-10d",
					instrument.getType(),
					instrument.getPrice(),
					instrument.getBrand(),
					instrument.getInstrumentId()));
		}
	}

	private void rentAnInstrument() {
		if (contr.checkEligibleForRental()) {
			// VALID FOR RETAL
			System.out.println("IMPLEMENT FUNCTIONALITY HERE");
			System.out.println("CURRENT ACTIVE LEASES: " + this.contr.getStudent().getActiveRentals());
			String inputString = this.inputScanner.nextLine();
		} else {
			System.err.println(contr.getStudent().getName()
					+ ", you already have the maximum amount of active rentals.\nFeel free to terminate a rental in order to rent a new instrument!");
			promptEnterToContinue();
		}

		// listAllAvailableInstruments();
		// System.out.println("\nChoose an instrument by selecting a valid ID\n");

		// int inputInteger = 0;
		// try {
		// inputInteger = Integer.parseInt(inputString);
		// } catch (Exception e) {
		//
		// }

	}

	/**
	 * Prompts the user to press any key in order to continue
	 */
	private void promptEnterToContinue() {
		System.out.println("\nPress ENTER key to continue...");
		this.inputScanner.nextLine();
	}

	/**
	 * Clears the terminal, only used for aesthetics
	 */
	private void clearTerminal() {
		System.out.print("\033[H\033[2J");
		System.out.flush();
	}
}