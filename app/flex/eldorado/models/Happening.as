package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="happenings")]
  [Bindable]
  public class Happening extends RxModel {
    public static const LABEL:String = "title";

    public var title:String = "";

    public var description:String = "";

    [DateTime]
    public var date:Date = new Date;

    public var reminder:Boolean = false;

    [BelongsTo]
    public var user:User;

    public function Happening() {
      super(LABEL);
    }
  }
}
