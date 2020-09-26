//
//  DataService.m
//  Paws
//
//  Created by 陳昱宏 on 2020/9/18.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataService.h"
@import FirebaseDatabase;


@interface DataService ()

@end

@implementation DataService

-(FIRDatabaseReference*)BASE_REF {
    if (_BASE_REF == nil){
        _BASE_REF = [[FIRDatabase database] reference];
        return _BASE_REF;
    }else{
        return _BASE_REF;
    }
}

-(FIRDatabaseReference*)RESULTS_REF {
    if (_RESULTS_REF == nil) {
        _RESULTS_REF = [[FIRDatabase database] referenceWithPath:@"results"];
        return _RESULTS_REF;
    }else{
        return _RESULTS_REF;
    }
}

-(FIRDatabaseReference*)USER_REF {
    if (_USER_REF == nil) {
        _USER_REF = [[FIRDatabase database] referenceWithPath:@"users"];
        return _USER_REF;
    }else{
        return _USER_REF;
    }
}

-(FIRDatabaseReference *)CURRENT_USER {
    if (_CURRENT_USER == nil) {
        NSString *userID = (NSString *) [NSUserDefaults.standardUserDefaults valueForKey:@"uid"];
        _CURRENT_USER = [self.USER_REF child:userID];
        return _CURRENT_USER;
    }else{
        return _CURRENT_USER;
    }
}


+(instancetype)sharedInstance{
    static DataService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataService alloc] init];
    });
    
    return instance;
}

-(void) createNewAccount: (NSString *)uid user:(NSDictionary *)user {
    [[self.USER_REF child:uid] setValue:user withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        }else{
//            NSLog(@"OK");
        }
    }];
//    [_USER_REF setValue:user forKeyPath:uid];
}


@end
