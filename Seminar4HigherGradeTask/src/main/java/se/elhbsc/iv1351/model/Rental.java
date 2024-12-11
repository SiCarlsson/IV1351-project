package se.elhbsc.iv1351.model;

public class Rental {
  private int maximumActiveLeases;
  private int maximumNumberOfMonths;

  public Rental(RentalDTO rentalDTO) {
    this.maximumActiveLeases = rentalDTO.getMaximumActiveLeases();
    this.maximumNumberOfMonths = rentalDTO.getMaximumNumberOfMonths();
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
