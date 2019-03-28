//
//  BaseModel.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/22.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"theId" : @"id"//前边的是你想用的key，后边的是返回的key
             };
}
//-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    NSLog(@"%@没有匹配的键值对%@：%@",[self class],key,value);
//    //    if ([key isEqualToString:@"id"]) {
//    //        self.Userid = [value stringValue];
//    //    }
//
//}

//+ (NSDictionary *)objectClassInArray {
//    return @{
//             @"itemList" : [FTOneClickOrderItemModel class],@"tableList":[RoomModel class],@"itemOutletList":[FTitemOutletListModel class],
//             };
//}
@end
  
