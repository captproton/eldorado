package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="ranks")]
  [Bindable]
  public class Rank extends RxModel {
    public static const LABEL:String = "title";

    public var title:String = "";

    public var minPosts:int = 0;

    public function Rank() {
      super(LABEL);
    }
  }
}
