#import "KSHUser.h"
#import "KSHLike.h"
#import "KSHDislike.h"

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
    
    KSHLike *sampleLike = [NSEntityDescription insertNewObjectForEntityForName:@"Like" inManagedObjectContext:managedObjectContext];
    KSHDislike *sampleDislike = [NSEntityDescription insertNewObjectForEntityForName:@"Dislike" inManagedObjectContext:managedObjectContext];
    
    KSHArticle *coolArticle = [NSEntityDescription insertNewObjectForEntityForName:@"Article" inManagedObjectContext:managedObjectContext];
    KSHArticle *lameArticle = [NSEntityDescription insertNewObjectForEntityForName:@"Article" inManagedObjectContext:managedObjectContext];
    
    //    KSHTag *coolTag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:managedObjectContext];
    //    KSHTag *lameTag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:managedObjectContext];
    
    
    
    if (self) {
        self.firstName = @"Guest";
        self.lastName = @"User";
        self.username = @"guestuser";
        self.email = @"johnsmith@guest.com";
        self.industry = @"Sample Industry";
        self.function = @"Sample Function";
        
        [sampleLike likeWithUser:self forArticle:coolArticle];
        [sampleDislike dislikeWithUser:self forArticle:lameArticle];
        
        [self addLikesObject:sampleLike];
        [self addDislikesObject:sampleDislike];
    }
}

@end
