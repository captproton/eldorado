package eldorado.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="categories")]
  [Bindable]
  public class Category extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    public var position:int = 0;

    [HasMany]
    public var forums:ModelsCollection;
    
    public function Category() {
      super(LABEL);
    }
  }
}
