#import "KSHDislike.h"


@interface KSHDislike ()

// Private interface goes here.

@end


@implementation KSHDislike

- (void)dislikeWithUser:(KSHUser *)user forArticle:(KSHArticle *)article
{
    self.flag = @NO;
    self.user = user;
    self.article = article;
}

- (void)dislikeWithUser:(KSHUser *)user forTag:(KSHTag *)tag
{
    self.flag = @NO;
    self.user = user;
    self.tag = tag;
}

- (void) awakeFromInsert
{
    [super awakeFromInsert];
    self.flag = @NO;
}

@end
