package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="logged_exceptions")]
  [Bindable]
  public class LoggedException extends RxModel {
    public static const LABEL:String = "exceptionClass";

    public var exceptionClass:String = "";

    public var controllerName:String = "";

    public var actionName:String = "";

    public var message:String = "";

    public var backtrace:String = "";

    public var environment:String = "";

    public var request:String = "";

    public function LoggedException() {
      super(LABEL);
    }
  }
}
