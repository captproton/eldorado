package eldorado.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="forums")]
  [Bindable]
  public class Forum extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    public var description:String = "";

    public var topicsCount:int = 0;

    public var postsCount:int = 0;

    public var position:int = 0;

    [BelongsTo]
    public var category:Category;

    [HasMany]
    public var topics:ModelsCollection;
    
    public function Forum() {
      super(LABEL);
    }
  }
}
