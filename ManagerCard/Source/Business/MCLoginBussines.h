#import <UIKit/UIKit.h>
#import "MCProvider.h"
#import "MCUserModel.h"

@interface MCLoginBussines : NSObject

@property (strong, nonatomic) MCProvider *loginProvider;

- (void)login:(NSString *)email withPassword:(NSString *)senha success:(void(^)(MCUserModel *user))success
      failure:(void(^)(NSError *error))failure;

@end
