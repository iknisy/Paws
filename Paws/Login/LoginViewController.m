//
//  LoginViewController.m
//  FirebaseLogin
//
//  Created by 陳昱宏 on 2020/9/13.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import "LoginViewController.h"
@import Firebase;
@import FirebaseAuth;
#import "DataService.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize emailTextField;
@synthesize passwordTextField;

-(IBAction)loginAction:(id)sender {
    if ([emailTextField.text isEqualToString: @""] || [passwordTextField.text isEqualToString: @""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please enter your email and password" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:nil];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        [FIRAuth.auth signInWithEmail:emailTextField.text password:passwordTextField.text completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
            if (error == nil) {
                [[DataService sharedInstance] createNewAccount:authResult.user.uid user: @{@"provider":authResult.user.providerID, @"email":self.emailTextField.text}];
                [NSUserDefaults.standardUserDefaults setValue:authResult.user.uid forKeyPath:@"uid"];
                
//                UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@""];
//                controller.modalPresentationStyle = UIModalPresentationFullScreen;
//                [self presentViewController:controller animated:YES completion:nil];
//                [self.navigationController.viewControllers[0] dismissViewControllerAnimated:YES completion:nil];
                UIViewController *root = self;
                while (YES) {
                    if (root.presentingViewController == nil) {
                        break;
                    }else{
                        root = root.presentingViewController;
                    }
                }
                [root dismissViewControllerAnimated:YES completion:nil];
            }else{
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:(UIAlertControllerStyleAlert)];
                
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:nil];
                [alertController addAction:okAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
