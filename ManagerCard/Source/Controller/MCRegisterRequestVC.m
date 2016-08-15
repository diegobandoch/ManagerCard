//
//  MCSolicitacaoCadastroVC.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/2/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCRegisterRequestVC.h"
#import "MCRegisterModel.h"
#import "MCRegisterRequestManager.h"

@implementation MCRegisterRequestVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CardIOUtilities preload];
    self.registerView = (MCRegisterRequestView *)self.view;
    self.loadingRegister.hidden = YES;
    
}

- (IBAction)scanCard:(id)sender {
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    [self presentViewController:scanViewController animated:YES completion:nil];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    NSLog(@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.redactedCardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv);
 
    self.registerView.cartaoRegister.text = info.redactedCardNumber;
    
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapRegisterRequest:(id)sender {
    
    [self.loadingRegister startAnimating];
    
    if (![self.registerView isValidFields]){
        [self fatalAlert:@"Campos inválidos, verifique e tente novamente"];
        return;
    }
    
    if ([self.registerManager isEthernetConnected]){
        [self fatalAlert:@"Não há conexão com a internet, por favor tente mais tarde."];
        return;
    }
    
    typeof(self) __weak __block weakSelf = self;
    
    MCRegisterModel *userModel = [[MCRegisterModel alloc] init];
    userModel.name = self.registerView.nomeRegister.text;
    userModel.email = self.registerView.emailRegister.text;
    userModel.phoneNumber = self.registerView.celularRegister.text;
    userModel.cardNumber = self.registerView.cartaoRegister.text;
    
    [self.registerManager registerUser:userModel
         withCompletionBlock:^(NSString *result, NSError *error) { [weakSelf loginResponse:result error:error];
         }];
    
    [self.loadingRegister stopAnimating];
}

-(MCRegisterRequestManager *)registerManager{
    if (_registerManager == nil){
        _registerManager = [[MCRegisterRequestManager alloc] init];
    }
    return _registerManager;
}

- (void)loginResponse:(NSString *)user error:(NSError *)error {
    
    if (error == nil) {
        [self performSegueWithIdentifier:@"registerRequestSegue" sender:nil];
    } else {
        [self fatalAlert:[error localizedDescription]];
    }
}

- (void)fatalAlert:(NSString *)msg{
    [[[UIAlertView alloc] initWithTitle:@"Solicitação de cadastro"
                                message:msg
                               delegate:self // we're going to cancel when dismissed
                      cancelButtonTitle:@"OK"
                      otherButtonTitles: nil] show];
    
    //UIAlertController *alert;
}


@end
