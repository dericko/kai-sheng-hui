//
//  KSHUser+guestUser.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUser+guestUser.h"
#import "KSHLike+helper.h"
#import "KSHDislike+helper.h"

@implementation KSHUser (guestUser)

- (void)setupGuestUserWithContext:(NSManagedObjectContext *)managedObjectContext
{

    KSHLike *sampleLike = [NSEntityDescription insertNewObjectForEntityForName:@"Like" inManagedObjectContext:managedObjectContext];
    KSHDislike *sampleDislike = [NSEntityDescription insertNewObjectForEntityForName:@"Dislike" inManagedObjectContext:managedObjectContext];

    KSHArticle *coolArticle = [NSEntityDescription insertNewObjectForEntityForName:@"Article" inManagedObjectContext:managedObjectContext];
    KSHArticle *lameArticle = [NSEntityDescription insertNewObjectForEntityForName:@"Article" inManagedObjectContext:managedObjectContext];

//    KSHTag *coolTag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:managedObjectContext];
//    KSHTag *lameTag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:managedObjectContext];
    
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

@end
