//
//  ResetPasswordViewController.h
//  FirebaseLogin
//
//  Created by 陳昱宏 on 2020/9/13.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResetPasswordViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

-(IBAction)submitAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
