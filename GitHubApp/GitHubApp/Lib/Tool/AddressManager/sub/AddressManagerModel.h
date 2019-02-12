//
//  AddressManagerModel.h
//  baishanghui
//
//  Created by Test on 2019/2/12.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressManagerModel : NSObject
@property (nonatomic,strong) NSString *isDefault;
@property (nonatomic,strong) NSString *detail_address;
@property (nonatomic,strong) NSString *theID;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *region;
@end

NS_ASSUME_NONNULL_END
