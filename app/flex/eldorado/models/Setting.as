package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="settings")]
  [Bindable]
  public class Setting extends RxModel {
    public static const LABEL:String = "title";

    public var title:String = "";

    public var tagline:String = "";

    public var announcement:String = "";

    public var footer:String = "";

    public var theme:String = "";

    public var favicon:String = "";

    public var timeZone:String = "";

    public var hushHush:Boolean = false;

    public var loginMessage:String = "";

    public var adminOnlyCreate:String = "";

    public function Setting() {
      super(LABEL);
    }
  }
}
