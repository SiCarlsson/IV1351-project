package se.elhbsc.iv1351.model;

public class InstrumentDTO {
  private String type;
  private String brand;
  private String price;
  private int instrumentId;
  private String startDate;
  private String endDate;

  /**
   * Constructor
   * 
   * @param type         Type of instrument
   * @param brand        Brand of instrument
   * @param price        Price per month of instrument
   * @param instrumentId Id of instrument
   */
  public InstrumentDTO(String type, String brand, String price, int instrumentId) {
    this.type = type;
    this.brand = brand;
    this.price = price;
    this.instrumentId = instrumentId;
  }

  /**
   * Constructor
   * 
   * @param type         Type of instrument
   * @param brand        Brand of instrument
   * @param instrumentId Id of instrument
   * @param startDate    The beginning of the rental period
   * @param endDate      The end of the rental period
   */
  public InstrumentDTO(String type, String brand, int instrumentId, String startDate, String endDate) {
    this.type = type;
    this.brand = brand;
    this.instrumentId = instrumentId;
    this.startDate = startDate;
    this.endDate = endDate;
  }

  /**
   * Get method for type
   * 
   * @return The type of the instance
   */
  public String getType() {
    return this.type;
  }

  /**
   * Get method for brand
   * 
   * @return The brand of the instance
   */
  public String getBrand() {
    return this.brand;
  }

  /**
   * Get method for price
   * 
   * @return The price of the instance
   */
  public String getPrice() {
    return this.price;
  }

  /**
   * Get method for instrumentId
   * 
   * @return The id of the instance
   */
  public int getInstrumentId() {
    return this.instrumentId;
  }

  /**
   * Getter method for start date
   * @return The start date if existing, else empty string
   */
  public String getStartDate() {
    if (this.startDate != null) {
      return this.startDate;
    }
    else {
      return "";
    }
  }

    /**
   * Getter method for start date
   * @return The start date if existing, else empty string
   */
  public String getEndDate() {
    if (this.endDate != null) {
      return this.endDate;
    }
    else {
      return "";
    }
  }
}
