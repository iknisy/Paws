//
//  CatModel.m
//  Paws
//
//  Created by 陳昱宏 on 2020/9/22.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatModel.h"
@import FirebaseDatabase;
//#import "DataService.h"

@interface CatModel ()

@end

@implementation CatModel

@synthesize Name;
@synthesize Credit;
@synthesize Vote;
@synthesize Url;

- (instancetype) initWithDict:(NSDictionary *)dict {
    self = [super init];
    
    if ([dict[@"name"] isKindOfClass: [NSString class]]) {
        Name = dict[@"name"];
    }
    if ([dict[@"cc_by"] isKindOfClass:[NSString class]]) {
        Credit = dict[@"cc_by"];
    }
    Vote = dict[@"votes"];
    if ([dict[@"url"] isKindOfClass:[NSString class]]) {
        Url = dict[@"url"];
    }
    
    return self;
}

//- (void)voteCat: (NSInteger)index {
//    Vote = [Vote initWithLong:Vote.longValue+1];
//    NSString *path = [NSString stringWithFormat:@"%ld/votes", index];
//    [DataService.sharedInstance.RESULTS_REF setValue:Vote forKeyPath:path];
//}

@end
