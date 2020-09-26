//
//  ResetPasswordViewController.m
//  FirebaseLogin
//
//  Created by 陳昱宏 on 2020/9/13.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import "ResetPasswordViewController.h"
@import Firebase;
@import FirebaseAuth;

@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController

@synthesize emailTextField;

-(IBAction)submitAction:(id)sender {
    if ([emailTextField.text isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please enter your email" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:nil];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        [FIRAuth.auth sendPasswordResetWithEmail:emailTextField.text completion:^(NSError * _Nullable error) {
            if (error == nil) {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success" message:@"Password reset mail sent." preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    UIViewController *root = self;
                    while (YES) {
                        if (root.presentingViewController == nil) {
                            break;
                        }else{
                            root = root.presentingViewController;
                        }
                    }
                    [root dismissViewControllerAnimated:YES completion:nil];
                }];
                [alertController addAction:okAction];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }else{
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:(UIAlertControllerStyleAlert)];
                
                UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:nil];
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
