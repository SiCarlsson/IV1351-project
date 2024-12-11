package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.view;

import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.controller.Controller;
import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.model.InstrumentDTO;
import java.util.List;
import java.util.Scanner;

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
     * Contains all logic regarding the initial menu
     */
    public void displayMenu() {
        clearTerminal();

        while (true) {
            String[] defaultAlternatives = { "Log in with Student-ID", "End program\n" };
            System.out.println("Choose an alternative... (integer)\n");
            for (int i = 0; i < defaultAlternatives.length; i++) {
                System.out.println((i + 1) + ". " + defaultAlternatives[i]);
            }
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
                    System.out.println("No need to choose a valid integer number...\n");
            }
        }
    }

    /**
     * Holds the logic of logging in a specific student
     */
    private void logInStudent() {
        clearTerminal();
        String goBackString = "[Choose 0 to go back to main menu]\n";
        while (true) {
            System.out.println("What is your Student-ID? Please specify... (integer)\n" + goBackString);
            String inputString = this.inputScanner.nextLine();

            try {
                int inputInteger = Integer.parseInt(inputString);
                if (inputInteger == 0) {
                    clearTerminal();
                    break;
                } else if (inputInteger > 0) {
                    loggedInMenu(inputInteger);
                    break;
                } else {
                    clearTerminal();
                    System.err.println("You must choose an integer greater than 0 (>0)\n");
                }

            } catch (Exception e) {
                clearTerminal();
                System.err.println("You need to give a correct input (integer > 0)\n");
            }
        }
    }

    /**
     * Contains all logic regarding logged in menu
     *
     * @param studentId the id of the logged in student
     */
    private void loggedInMenu(int studentId) {
        clearTerminal();
        System.out.println("Logged in as Student-ID: " + studentId);

        while (true) {
            String[] loggedInAlternatives = { "List available instruments", "Log out\n" };
            System.out.println("Choose an alternative... (integer)\n");
            for (int i = 0; i < loggedInAlternatives.length; i++) {
                System.out.println((i + 1) + ". " + loggedInAlternatives[i]);
            }
            String input = this.inputScanner.nextLine();

            switch (input) {
                // List available instruments
                case "1":
                    listAvailableInstruments();
                    break;

                // Log out
                case "2":
                    clearTerminal();
                    return;

                default:
                    clearTerminal();
                    System.out.println("No need to choose a valid integer number...\n");
            }
        }
    }

    /**
     * Lists all available instruments of a specific kind.
     */
    private void listAvailableInstruments() {
        clearTerminal();
        System.out.println("Do you want to sort the instruments by type? (yes/no):");
        String sortInput = this.inputScanner.nextLine().trim().toLowerCase();
        String sortBy = sortInput.equals("yes") ? "type" : "";

        try {
            List<InstrumentDTO> instruments = contr.listAvailableInstruments(sortBy);
            if (instruments.isEmpty()) {
                System.out.println("No available instruments found.");
            } else {
                System.out.println("Available instruments:");
                for (InstrumentDTO instrument : instruments) {
                    System.out.println(instrument);
                }
            }
        } catch (Exception e) {
            System.out.println("Could not list instruments: " + e.getMessage());
            e.printStackTrace();
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
