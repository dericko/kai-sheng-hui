Kai Sheng Hui Specifications.

Application Spec:
iOS: 7.1+
Xcode: 5.1.1
Version Control: GIT
Remote: https://www.github.com/derick/kai-sheng-hui
Branches: master, development(dataModelDevelopment, networkingDevelopment, viewDevelopment)

Description:
iOS Application for 凯盛汇 platform. A multiple-function hub for Capvision Experts.
-check and share news curated for user's industry and interests with offline reading
-check current project and event status in real time
-browse project opportunities
-browse upcoming events
-check other member items related to KSH profile

Testing:
Network testing uses RestKit patterns (See https://github.com/RestKit/RestKit/wiki/Unit-Testing-with-RestKit)

Structure:
-Networking
	Object Managers - parent class handles general networking API requests
			- subclasses handle individual request/response options
	Mapping Provider - handles JSON-to-ManagedObject mapping
-Model
	User > RegisteredUser, Member
	MemberItem > Project, Event
    Content > Article
-Controllers
-Views
    primarily handled in storyboard

Libraries/Dependencies: (managed by CocoaPods, see Podfile)
Core Data - Apple’s object mapping system + persistent store api
	uses SQLite
	<FetchedResultsController> in view controllers
	partially handled by RestKit

MOGenerator - builds editable subclasses for Core Data class customization
	*requires separate installation

RestKit 0.20.00 - used for networking
	Key Files:
	-KSHObjectManager - handles network calls
	-KSHMappingProvider - maps JSON to local objects (in Core Data)

SWTableViewCell - cell swiping with buttons
	used in ArticleControllers

MBProgressHUD - loading view for login + networking
	used in LoginViewController class

TSMessages - top and bottom messages
	used in ArticleControllers
	used in LoginController

PDKeyChainBindingController - helpers for Apple Keychain services
	currently unimplemented
