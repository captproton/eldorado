package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="messages")]
  [Bindable]
  public class Message extends RxModel {
    public static const LABEL:String = "body";

    public var body:String = "";

    [BelongsTo]
    public var user:User;

    public function Message() {
      super(LABEL);
    }
  }
}
