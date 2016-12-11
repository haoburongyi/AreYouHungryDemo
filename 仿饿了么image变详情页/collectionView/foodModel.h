//
//  foodModel.h
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface foodModel : NSObject
@property (nonatomic, copy)NSString *imgName;
@property (nonatomic, copy)NSString *foodName;
@property (nonatomic, assign)CGFloat money;
@end
