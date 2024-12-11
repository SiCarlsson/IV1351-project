package se.elhbsc.iv1351.model;

public class InstrumentDTO {
  private String type;
  private String brand;
  private String price;
  private int instrumentId;

  public InstrumentDTO(String type, String brand, String price, int instrumentId) {
    this.type = type;
    this.brand = brand;
    this.price = price;
    this.instrumentId = instrumentId;
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
}
