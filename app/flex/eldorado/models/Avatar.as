package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="avatars")]
  [Bindable]
  public class Avatar extends RxModel {
    public static const LABEL:String = "attachmentFileName";

    public var attachmentFileName:String = "";

    public var attachmentContentType:String = "";

    public var attachmentFileSize:int = 0;

    public var attachmentRemoteUrl:String = "";

    [BelongsTo]
    public var user:User;

    [Ignored]
    public var attachmentUrl:String;
    
    public function Avatar() {
      super(LABEL);
    }
  }
}
