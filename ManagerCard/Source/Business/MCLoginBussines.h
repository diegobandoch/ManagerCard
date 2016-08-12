#import <UIKit/UIKit.h>
#import "MCLoginProvider.h"
#import "MCUserModel.h"

@interface MCLoginBussines : NSObject

@property (strong, nonatomic) MCLoginProvider *loginProvider;

- (void)login:(NSString *)email withPassword:(NSString *)senha success:(void(^)(MCUserModel *user))success
      failure:(void(^)(NSError *error))failure;

-(BOOL)isEthernetConnected;
@end
