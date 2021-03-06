package eldorado.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="headers")]
  [Bindable]
  public class Header extends RxModel {
    public static const LABEL:String = "description";

    public var description:String = "";

    public var votes:int = 0;

    public var attachmentFileName:String = "";

    public var attachmentContentType:String = "";

    public var attachmentFileSize:int = 0;

    public var attachmentRemoteUrl:String = "";

    [BelongsTo]
    public var user:User;

    [Ignored]
    public var attachmentUrl:String;
    
    public function Header() {
      super(LABEL);
    }
  }
}
