package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="subscriptions")]
  [Bindable]
  public class Subscription extends RxModel {
    public static const LABEL:String = "id";

    [BelongsTo]
    public var user:User;

    [BelongsTo]
    public var topic:Topic;

    public function Subscription() {
      super(LABEL);
    }
  }
}
