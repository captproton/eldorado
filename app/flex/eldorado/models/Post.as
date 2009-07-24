package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="posts")]
  [Bindable]
  public class Post extends RxModel {
    public static const LABEL:String = "body";

    public var body:String = "";

    public var updatedBy:int = 0;

    [BelongsTo]
    public var user:User;

    [BelongsTo]
    public var topic:Topic;

    public function Post() {
      super(LABEL);
    }
  }
}
