 #import "KSHUser.h"
#import <RestKit/RestKit.h>
#import "KSHUserManager.h"

@interface KSHUser ()

// Private interface goes here.

@end

static NSString const *kCurrentUserIDKey = @"kCurrentUserIDKey";
static KSHUser *currentUser = nil;

@implementation KSHUser

+ (KSHUser *)currentUser
{
    // Return the current user if it exists
    if (currentUser) {
        return currentUser;
    }
    
    // Get the default managed object context
    NSManagedObjectContext *managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    
    // An error to be dealt with if a fetchRequest or save operation fail
    NSError *error = nil;
    
    // Try to get userID (if in user defaults)
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentUserIDKey];
    
    // If userID exists, fetch the user from default managed object context
    if (userID) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:[NSEntityDescription
                            entityForName:@"User" inManagedObjectContext:managedObjectContext]];
        NSArray *userArray = [managedObjectContext executeFetchRequest:request error:&error];
        if (userArray == nil) {
            NSLog(@"Fetch request returned an empty userArray. Error message: %@", error);
        } else if ([userArray count] > 1) {
            NSLog(@"Serious application error. Multiple users in managed object context. Returning first user we can find (but you should really fix this).");
            currentUser = [userArray firstObject];
        }
        
        currentUser = [userArray firstObject];
        
        // If userID does not exist, create a new user and insert it into default managed object context
    } else {
        
        // TODO: Error! Tried to get current user when none exists. Prompt to log in.
        
    }
    
    
    // Final check to make sure the currentUser has been set
    //    NSAssert(currentUser, @"currentUser is still nil! Check your fetch requests and error handling in [KSHUser currentUser]");
    
    return currentUser;
}

+ (void)logout
{
    currentUser = nil;
}

@end
