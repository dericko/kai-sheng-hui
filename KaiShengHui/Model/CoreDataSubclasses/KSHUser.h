#import "_KSHUser.h"

extern NSString const *UserDidLoginNotification;
extern NSString const *UserDidLogoutNotification;


@interface KSHUser : _KSHUser {}

+ (KSHUser *)currentUser;

+ (void)logout;

@end

