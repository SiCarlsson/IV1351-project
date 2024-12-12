package se.elhbsc.iv1351.view;

import java.util.ArrayList;
import java.util.List;
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
	 * @throws Exception
	 * 
	 */
	public void displayMenu() throws Exception {
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
	 * @throws Exception
	 */
	private void logInStudent() throws Exception {
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
	 * @throws Exception
	 */
	private void loggedInMenu() throws Exception {
		clearTerminal();
		String[] alternatives = { "List all available instruments", "Rent an instrument", "Terminate a rental",
				"Log out\n" };
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
					terminateARental();
					clearTerminal();
					break;
				case "4":
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

	private void rentAnInstrument() throws ExternalDatabaseSystemException {
		if (contr.checkEligibleForRental()) {
			List<Integer> availableInstrumentIds = retrieveAvailableInstrumentIds();

			while (true) {
				if (availableInstrumentIds.isEmpty()) {
					System.out.println("We are sorry, there are no instruments available!");
					promptEnterToContinue();
					break;
				}

				System.out
						.println("Choose an instrument you want to rent: (by ID)\n[Select 0 to go back to the logged in menu]\n");
				listAllAvailableInstruments();

				System.out.println();
				String inputString = this.inputScanner.nextLine();

				try {
					int inputInteger = Integer.parseInt(inputString);

					if (inputInteger == 0) {
						break;
					} else if (availableInstrumentIds.contains(inputInteger)) {
						this.contr.rentAnInstrument(inputInteger);
						this.contr.getStudent().increaseActiveRentalsByOne();
						clearTerminal();
						System.out.println("RENTAL COMPLETED! Enjoy your new instrument!");
						promptEnterToContinue();
						break;
					} else {
						System.err.println("You need to select a valid instrument ID...\n");
					}

				} catch (Exception e) {
					clearTerminal();
					System.err.println("Your input has to be an integer value...\n");
				}
			}

		} else {
			System.err.println(contr.getStudent().getName()
					+ ", you already have the maximum amount of active rentals.\nFeel free to terminate a rental in order to rent a new instrument!");
			promptEnterToContinue();
		}
	}

	private List<Integer> retrieveAvailableInstrumentIds() throws ExternalDatabaseSystemException {
		List<Integer> availableInstrumentIds = new ArrayList<>();
		for (InstrumentDTO instrument : contr.retrieveAllAvailableInstruments()) {
			availableInstrumentIds.add(instrument.getInstrumentId());
		}
		return availableInstrumentIds;
	}

	private void terminateARental() throws Exception {
		List<Integer> allRentalsIds = new ArrayList<>();
		for (InstrumentDTO rental : this.contr.collectAllActiveRentals()) {
			allRentalsIds.add(rental.getInstrumentId());
		}

		while (true) {
			if (allRentalsIds.isEmpty()) {
				System.out.println("You do not have any rentals to terminate!");
				promptEnterToContinue();
				break;
			}

			listAllActiveLeases();

			String inputString = this.inputScanner.nextLine();
			try {
				int inputInteger = Integer.parseInt(inputString);

				if (inputInteger == 0) {
					break;
				} else if (allRentalsIds.contains(inputInteger)) {
					this.contr.terminateRentalAgreement(inputInteger);
					this.contr.getStudent().decreaseActiveRentalByOne();
					clearTerminal();
					System.out.println("TERMINATION COMPLETED! Remeber to bring back your instrument as soon as possible!");
					promptEnterToContinue();
					break;
				} else {
					clearTerminal();
					System.err.println("You need to choose a valid integer ID...\n");
				}
			} catch (Exception e) {
				clearTerminal();
				System.err.println("Please specify an actual integer value...\n");
				throw new Exception(e.getMessage());
			}
		}

	}

	private void listAllActiveLeases() throws ExternalDatabaseSystemException {
		System.out
				.println("Which rental do you wish to terminate? Select an ID:\n[Select 0 to go back to the logged in menu]\n");

		System.out.printf("%-15s %-20s %-15s %-15s %-10s%n", "Type", "Brand", "Start date", "End date", "ID");
		System.out.println("---------------------------------------------------------------------------");

		for (InstrumentDTO rental : this.contr.collectAllActiveRentals()) {
			System.out.printf(
					"%-15s %-20s %-15s %-15s %-10d%n",
					rental.getType(),
					rental.getBrand(),
					rental.getStartDate(),
					rental.getEndDate(),
					rental.getInstrumentId());
		}
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