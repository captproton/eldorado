package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="articles")]
  [Bindable]
  public class Article extends RxModel {
    public static const LABEL:String = "title";

    public var title:String = "";

    public var body:String = "";

    public var commentsCount:int = 0;

    [BelongsTo]
    public var user:User;

    public function Article() {
      super(LABEL);
    }
  }
}
