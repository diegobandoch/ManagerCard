#import <UIKit/UIKit.h>
#import "MCEthernetBussines.h"
#import "AFNetworkReachabilityManager.h"

@implementation MCEthernetBussines

-(BOOL)isEthernetConnected{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

@end
