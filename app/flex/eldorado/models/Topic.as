package eldorado.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="topics")]
  [Bindable]
  public class Topic extends RxModel {
    public static const LABEL:String = "title";

    public var title:String = "";

    public var views:int = 0;

    public var postsCount:int = 0;

    [DateTime]
    public var lastPostAt:Date = new Date;

    public var lastPostBy:int = 0;

    public var locked:Boolean = false;

    public var sticky:Boolean = false;

    [BelongsTo]
    public var user:User;

    [BelongsTo]
    public var forum:Forum;

    [HasMany]
    public var posts:ModelsCollection;
    
    [HasMany]
    public var subscriptions:ModelsCollection;
    
    [HasMany]
    public var viewings:ModelsCollection;
    
    public function Topic() {
      super(LABEL);
    }
  }
}
