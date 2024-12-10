package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.view;

import java.util.Scanner;

import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.controller.Controller;
import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.integration.StudentDTO;

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
      System.out.println("Chose an alternative... (integer)\n");
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
          System.out.println("No need to chose a valid integer number...\n");
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
        if (inputInteger > 0) {
          // VERIFY THAT ID EXISTS HERE THROUGH CONTROLLER -> DATABASE -> STUDENTDTO -> VIEW
          loggedInMenu(inputInteger);
          break;
        }
        else {
          clearTerminal();
          System.err.println("You must chose an integer greater than 0 (>0)\n");
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
    System.out.println("Logged in as JOHNDOE. Student-ID: " + studentId);
  }

  /**
   * Clears the terminal, only used for aesthetics
   */
  private void clearTerminal() {
    System.out.print("\033[H\033[2J");
    System.out.flush();
  }
}
