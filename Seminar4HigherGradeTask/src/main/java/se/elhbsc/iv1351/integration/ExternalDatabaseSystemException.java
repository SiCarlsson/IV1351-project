package se.elhbsc.iv1351.integration;

public class ExternalDatabaseSystemException extends Exception {

  /**
   * Own exception handler taking reason as a parameter
   * 
   * @param reason Why the exception was thrown
   */
  public ExternalDatabaseSystemException(String reason) {
    super(reason);
  }

  /**
   * Own exception handler taking both reason and root cause as a parameter
   * 
   * @param reason    Why the exception was thrown
   * @param rootCause The root exception
   */
  public ExternalDatabaseSystemException(String reason, Throwable rootCause) {
    super(reason, rootCause);
  }
}
