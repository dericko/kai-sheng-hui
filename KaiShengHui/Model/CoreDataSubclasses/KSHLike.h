#import "_KSHLike.h"

@interface KSHLike : _KSHLike {}

- (void)likeWithUser:(KSHUser *)user forTag:(KSHTag *)tag;
- (void)likeWithUser:(KSHUser *)user forArticle:(KSHArticle *)article;

@end
