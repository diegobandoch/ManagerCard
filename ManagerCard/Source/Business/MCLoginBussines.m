#import "MCLoginBussines.h"
#import "MCLoginProvider+User.h"
#import "MCUserModel.h"


@implementation MCLoginBussines

- (void)login:(NSString *)email
 withPassword:(NSString *)senha
      success:(void(^)(MCUserModel *user))success
      failure:(void(^)(NSError *error))failure {
    
    MCLoginProvider *sessionManager = [MCLoginProvider instanceHTTP];
    
    [sessionManager login:email withPassword:senha success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *resp = responseObject;
        if ([resp isKindOfClass:[NSDictionary class]]) {
            if ([resp objectForKey:@"user"]) {
                MCUserModel *user = [[MCUserModel alloc] initWithLoginResponse:resp];
                [self saveICUserInUserDefaults:resp];
                success(user);
            } else {
                NSString *messageError = resp[@"message"];
                NSError *errorLogin = [NSError errorWithDomain:@"br.com.ciandt.managercard" code:1 userInfo:[NSDictionary dictionaryWithObject:messageError forKey:NSLocalizedDescriptionKey]];
                failure(errorLogin);
            }
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void) saveICUserInUserDefaults:(NSDictionary *)resp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:resp forKey:@"user"];
    [defaults synchronize];
}

-(MCLoginProvider *) loginProvider{
    if (_loginProvider == nil){
        _loginProvider = [[MCLoginProvider alloc] init];
    }
    return _loginProvider;
}

-(BOOL)isEthernetConnected{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

@end
