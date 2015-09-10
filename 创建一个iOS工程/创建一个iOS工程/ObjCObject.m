//
//  ObjCObject.m
//  创建一个iOS工程
//
//  Created by 欣 陈 on 15/9/8.
//  Copyright (c) 2015年 欣 陈. All rights reserved.
//

#import "ObjCObject.h"

@implementation ObjCObject

-(NSString *)sayHello : (NSString *)greeting withName : (NSString *)name
{
    NSString *string = [NSStringstringWithFormat : @"Hi,%@ %@.",name,greeting];
    return string;
}
@end
