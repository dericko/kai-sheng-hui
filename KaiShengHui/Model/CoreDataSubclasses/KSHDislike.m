#import "KSHDislike.h"


@interface KSHDislike ()

// Private interface goes here.

@end


@implementation KSHDislike

- (void)dislikeWithUser:(KSHUser *)user forArticle:(KSHArticle *)article
{
    self.user = user;
    self.article = article;
}

- (void)dislikeWithUser:(KSHUser *)user forTag:(KSHTag *)tag
{
    self.user = user;
    self.tag = tag;
}

@end
