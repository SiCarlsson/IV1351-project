package Seminar4HigherGradeTasks.se.elhbsc.iv1351.source.model;

public class InstrumentDTO {
    private final String instrumentType;
    private final String brand;
    private final double price;

    public InstrumentDTO(String instrumentType, String brand, double price) {
        this.instrumentType = instrumentType;
        this.brand = brand;
        this.price = price;
    }

    public String getinstrumentType() {
        return instrumentType;
    }

    public String getBrand() {
        return brand;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Instrument: " + instrumentType + ", Brand: " + brand + ", Price: " + price + " SEK/month";
    }
}
