//
//  DataService.h
//  Paws
//
//  Created by 陳昱宏 on 2020/9/18.
//  Copyright © 2020 iknisy. All rights reserved.
//

#ifndef DataService_h
#define DataService_h


#endif /* DataService_h */

@import FirebaseDatabase;

@interface DataService : NSObject {
    FIRDatabaseReference* _BASE_REF;
    FIRDatabaseReference* _RESULTS_REF;
    FIRDatabaseReference* _USER_REF;
    FIRDatabaseReference* _CURRENT_USER;
}

@property (nonatomic, readonly, strong) FIRDatabaseReference *BASE_REF;
@property (nonatomic, readonly, strong) FIRDatabaseReference *RESULTS_REF;
@property (nonatomic, readonly, strong) FIRDatabaseReference *USER_REF;
@property (nonatomic, readonly, strong) FIRDatabaseReference *CURRENT_USER;

+ (instancetype) sharedInstance;
- (void) createNewAccount:(NSString *)uid user:(NSDictionary *)user;

@end
