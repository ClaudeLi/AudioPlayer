//
//  MusicModel.m
//  AudioPlayer
//
//  Created by ClaudeLi on 16/4/1.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import "MusicModel.h"

@implementation MusicModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqual:@""]) {
        
    }
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

@end
