#import "KSHLike.h"


@interface KSHLike ()

// Private interface goes here.

@end


@implementation KSHLike

- (void)likeWithUser:(KSHUser *)user forArticle:(KSHArticle *)article
{
    self.flag = @YES;
    self.user = user;
    self.article = article;
    
    // Like all tags under article
    //    if (article.hasTags){
    //        for (KSHTag *tag in article.hasTags) {
    //            [self likeWithUser:user forTag:tag];
    //        }
    //    }
}

- (void)likeWithUser:(KSHUser *)user forTag:(KSHTag *)tag
{
    self.flag = @YES;
    self.user = user;
    self.tag = tag;
}

- (void) awakeFromInsert
{
    [super awakeFromInsert];
    self.flag = @YES;
}
@end
