package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="configs")]
  [Bindable]
  public class Config extends RxModel {
    public static const LABEL:String = "associatedType";

    public var associatedType:String = "";

    public var namespace:String = "";

    public var key:String = "";

    public var value:String = "";

    [BelongsTo(polymorphic="true", dependsOn="Model1, Model2")]
    public var associated:Object;
      
    public function Config() {
      super(LABEL);
    }
  }
}
