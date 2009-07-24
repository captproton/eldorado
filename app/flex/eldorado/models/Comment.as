package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="comments")]
  [Bindable]
  public class Comment extends RxModel {
    public static const LABEL:String = "begetterType";

    public var begetterType:String = "";

    public var body:String = "";

    [BelongsTo]
    public var user:User;

    [BelongsTo(polymorphic="true", dependsOn="Model1, Model2")]
    public var begetter:Object;
      
    public function Comment() {
      super(LABEL);
    }
  }
}
