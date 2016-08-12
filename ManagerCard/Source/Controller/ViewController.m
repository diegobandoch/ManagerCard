//
//  ViewController.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 7/27/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworkReachabilityManager.h"
#import "MCLoginView.h"


@interface ViewController ()
@end

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated{
    
    self.loginView = (MCLoginView *)self.view;
    
    self.loginView.email.text = @"";
    self.loginView.senha.text = @"";
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [self.navigationItem.backBarButtonItem setTitle:@"Back"];
    
    
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSInteger size = 3;
    
    return [self.loginView isValidSizeField: &size forTextField:textField];
}


- (void)fatalAlert:(NSString *)msg{
    [[[UIAlertView alloc] initWithTitle:@"Login"
                                message:msg
                               delegate:self // we're going to cancel when dismissed
                      cancelButtonTitle:@"OK"
                      otherButtonTitles: nil] show];
    
    //UIAlertController *alert;
}



- (IBAction)submitButtonLogin:(id)sender {
    [self.loginView.loading startAnimating];

    if ([self.loginManager isEthernetConnected]){
        [self dismissViewControllerAnimated:YES completion:nil];
         [self.loginView.loading stopAnimating];
        [self fatalAlert:@"não há conexão com a internet, por favor tente mais tarde."];
        return;
    }
    
    if (![self.loginView isValidFields]){
        [self dismissViewControllerAnimated:YES completion:nil];
        [self fatalAlert:@"campos inválidos, verifique e tente novamente"];
         [self.loginView.loading stopAnimating];
        return;
    }
    
    typeof(self) __weak __block weakSelf = self;
    
    [self.loginManager login:_loginView.email.text withPassword:_loginView.senha.text
    withCompletionBlock:^(MCUserModel *user, NSError *error) { [weakSelf loginResponse:user error:error];
    }];
    
    [self.loginView.loading stopAnimating];
}

-(MCLoginManager *)loginManager{
    if (_loginManager == nil){
        _loginManager = [[MCLoginManager alloc] init];
    }
    return _loginManager;
}

- (void)loginResponse:(MCUserModel *)user error:(NSError *)error {
    
    if (error == nil) {
        NSLog(@"Response: %@",user);
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
    } else {
        [self fatalAlert:[error localizedDescription]];
    }
}

@end
