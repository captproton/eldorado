package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="viewings")]
  [Bindable]
  public class Viewing extends RxModel {
    public static const LABEL:String = "id";

    [BelongsTo]
    public var user:User;

    [BelongsTo]
    public var topic:Topic;

    public function Viewing() {
      super(LABEL);
    }
  }
}
