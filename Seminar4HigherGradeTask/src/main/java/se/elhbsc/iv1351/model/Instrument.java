package se.elhbsc.iv1351.model;

public class Instrument {
  private String type;
  private String brand;
  private String price;
  private int instrumentId;

  /**
   * Constructor
   * 
   * @param type         Type of instrument
   * @param brand        Brand of instrument
   * @param price        Price per month of instrument
   * @param instrumentId Id of instrument
   */
  public Instrument(InstrumentDTO instrumentDTO) {
    this.type = instrumentDTO.getType();
    this.brand = instrumentDTO.getBrand();
    this.price = instrumentDTO.getPrice();
    this.instrumentId = instrumentDTO.getInstrumentId();
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
