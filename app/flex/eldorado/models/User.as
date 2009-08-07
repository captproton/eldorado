package eldorado.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="users")]
  [Bindable]
  public class User extends RxModel {
    public static const LABEL:String = "login";

    public var login:String = "";

    public var email:String = "";

    public var passwordHash:String = "";

    public var admin:Boolean = false;

    public var postsCount:int = 0;

    public var signature:String = "";

    public var bio:String = "";

    [DateTime]
    public var onlineAt:Date = new Date;

    public var avatar:String = "";

    public var authToken:String = "";

    [DateTime]
    public var authTokenExp:Date = new Date;

    public var timeZone:String = "";

    public var banMessage:String = "";

    [DateTime]
    public var bannedUntil:Date = new Date;

    [DateTime]
    public var chattingAt:Date = new Date;

    public var loggedOut:Boolean = false;

    public var articlesCount:int = 0;

    [DateTime]
    public var allViewedAt:Date = new Date;

    [HasMany]
    public var articles:ModelsCollection;
    
    [HasMany]
    public var avatars:ModelsCollection;
    
    [HasMany]
    public var comments:ModelsCollection;
    
    [HasMany]
    public var happenings:ModelsCollection;
    
    [HasMany]
    public var headers:ModelsCollection;
    
    [HasMany]
    public var messages:ModelsCollection;
    
    [HasMany]
    public var posts:ModelsCollection;
    
    [HasMany]
    public var subscriptions:ModelsCollection;
    
    [HasMany]
    public var themes:ModelsCollection;
    
    [HasMany]
    public var topics:ModelsCollection;
    
    [HasMany]
    public var uploads:ModelsCollection;
    
    [HasMany]
    public var viewings:ModelsCollection;
    
    public function User() {
      super(LABEL);
    }
  }
}
