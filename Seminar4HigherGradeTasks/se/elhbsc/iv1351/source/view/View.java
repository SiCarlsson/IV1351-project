package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.view;

import java.util.Scanner;

import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.controller.Controller;

public class View {
  private Controller contr;

  public View(Controller contr) {
    this.contr = contr;
  }

  public void displayMenu() {
    clearTerminal();
    Scanner inputScanner = new Scanner(System.in);

    while (true) {
      String[] defaultAlternatives = { "Log in user", "End program" };
      System.out.println("Chose an alternative... (integer)\n");
      for (int i = 0; i < defaultAlternatives.length; i++) {
        System.out.println((i + 1) + ". " + defaultAlternatives[i]);
      }
      String input = inputScanner.nextLine();

      switch (input) {
        // Log in user
        case "1":
          System.out.println("SWITCH CASE 1");
          break;

        // End program
        case "2":
          clearTerminal();
          inputScanner.close();
          System.out.println("Thanks for today!\n");
          System.exit(0);
          break;

        default:
          clearTerminal();
          System.out.println("No need to chose a valid integer number...\n");
      }
    }
  }

  private void clearTerminal() {
    System.out.print("\033[H\033[2J");
    System.out.flush();
  }
}
