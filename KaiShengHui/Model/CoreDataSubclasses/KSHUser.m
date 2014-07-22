#import "KSHUser.h"

@interface KSHUser ()

// Private interface goes here.

@end

@implementation KSHUser

- (void)setImage:(UIImage *)image
{
    [self setValue:UIImagePNGRepresentation(image) forKey:@"imgFile"];
}

- (UIImage *)getImage
{
    return [UIImage imageWithData:[self valueForKey:@"imgFile"]];
}

- (void)setupGuestUserWithContext:(NSManagedObjectContext *)managedObjectContext
{
    if (self) {

        self.username = @"guestuser";
    }
}

@end
