//
//  SignUpViewController.h
//  FirebaseLogin
//
//  Created by 陳昱宏 on 2020/9/12.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignUpViewController : UIViewController{
    
}

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

-(IBAction)createAccountAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
