//
//  MCSolicitacaoCadastroVC.h
//  ManagerCard
//
//  Created by Diego Bandoch dos Santos on 8/2/16.
//  Copyright © 2016 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardIO.h"
#import "MCRegisterRequestView.h"
#import "MCRegisterRequestManager.h"

@interface MCRegisterRequestVC : UIViewController <CardIOPaymentViewControllerDelegate>

@property (strong, nonatomic) MCRegisterRequestView *registerView;
@property (strong, nonatomic) MCRegisterRequestManager *registerManager;

- (IBAction)scanCard:(id)sender;
@end
