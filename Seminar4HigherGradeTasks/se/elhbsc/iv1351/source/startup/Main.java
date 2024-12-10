package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.startup;

import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.controller.Controller;
import Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.view.View;

public class Main {
  public static void main(String[] args) {
    Controller contr = new Controller();
    View view = new View(contr);
    view.displayMenu();
  }
}