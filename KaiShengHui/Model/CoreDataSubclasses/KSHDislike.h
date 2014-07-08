#import "_KSHDislike.h"

@interface KSHDislike : _KSHDislike {}

- (void)dislikeWithUser:(KSHUser *)user forArticle:(KSHArticle *)article;
- (void)dislikeWithUser:(KSHUser *)user forTag:(KSHTag *)tag;

@end
