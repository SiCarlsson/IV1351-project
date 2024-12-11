package se.elhbsc.iv1351.model;

public class RentalDTO {
  private int maximumActiveLeases;
  private int maximumNumberOfMonths;

  /**
   * Constructor
   * 
   * @param maximumActiveLeases   maximum amount of rentals permitted at one time
   * @param maximumNumberOfMonths maximum lenght of a rental
   */
  public RentalDTO(int maximumActiveLeases, int maximumNumberOfMonths) {
    this.maximumActiveLeases = maximumActiveLeases;
    this.maximumNumberOfMonths = maximumNumberOfMonths;
  }

  /**
   * Getter function to retrieve the maximum number of rentals a customer can have
   * at on time
   * 
   * @return Maximum amount of rentals at one time
   */
  public int getMaximumActiveLeases() {
    return this.maximumActiveLeases;
  }

  /**
   * Getter function to retrieve the maximum number of months a rental can be made
   * 
   * @return Maximum number of months of the instance
   */
  public int getMaximumNumberOfMonths() {
    return this.maximumNumberOfMonths;
  }
}
