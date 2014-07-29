#import "_KSHUser.h"

@interface KSHUser : _KSHUser {}

- (void)setupGuestUserWithContext:(NSManagedObjectContext *)managedObjectContext;

- (void)setImage:(UIImage *)image;
- (UIImage *)getImage;

@end