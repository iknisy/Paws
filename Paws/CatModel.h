//
//  CatModel.h
//  Paws
//
//  Created by 陳昱宏 on 2020/9/22.
//  Copyright © 2020 iknisy. All rights reserved.
//

#ifndef CatModel_h
#define CatModel_h


#endif /* CatModel_h */

@interface CatModel : NSObject {
    NSString* Name;
    NSString* Credit;
    NSNumber* Vote;
    NSString* Url;
}

@property (nonatomic, readonly, strong) NSString *Name;
@property (nonatomic, readonly, strong) NSString *Credit;
@property (nonatomic, readonly) NSNumber *Vote;
@property (nonatomic,readonly, strong) NSString *Url;


- (instancetype) initWithDict: (NSDictionary *)dict;
//- (void)voteCat: (NSInteger)index;

@end
