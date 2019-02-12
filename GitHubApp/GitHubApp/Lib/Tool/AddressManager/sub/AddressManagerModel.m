//
//  AddressManagerModel.m
//  baishanghui
//
//  Created by Test on 2019/2/12.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "AddressManagerModel.h"

@implementation AddressManagerModel
- (void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.theID = value;
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
