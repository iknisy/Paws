//
//  LoginViewController.h
//  FirebaseLogin
//
//  Created by 陳昱宏 on 2020/9/13.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController {
    IBOutlet UITextField *passwordTextField;
    IBOutlet UITextField *emailTextField;
}

@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UITextField *emailTextField;

-(IBAction)loginAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
