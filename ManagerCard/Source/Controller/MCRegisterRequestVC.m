//
//  MCSolicitacaoCadastroVC.m
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/2/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import "MCRegisterRequestVC.h"


@implementation MCRegisterRequestVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CardIOUtilities preload];
    self.registerView = (MCRegisterRequestView *)self.view;
    
    
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
    
    if (![self.registerView isValidFields]){
        [self fatalAlert:@"Campos inválidos, verifique e tente novamente"];
        return;
    }
    
    if ([self.registerManager isEthernetConnected]){
        [self fatalAlert:@"Não há conexão com a internet, por favor tente mais tarde."];
        return;
    }
       
    [self performSegueWithIdentifier:@"registerRequestSegue" sender:nil];
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
