//
//  AWSUserInfo.m
//  AWSMobileHubHelper
//
//  Created by Dubal, Rohan on 3/23/17.
//  Copyright © 2017 Amazon Web Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWSUserInfo.h"

@interface AWSUserInfo()

@property (nonatomic, strong) NSMutableDictionary *userAttributes;

@end

@implementation AWSUserInfo

-(id)getAttributeForKey:(NSString *)key {
    return [self.userAttributes objectForKey:key];
}


-(void)setAttribute:(id)value
             forKey:(NSString *)key {
    [self.userAttributes setValue:value
                           forKey:key];
}

- (instancetype)initWithUserName:(NSString *)userName
                        imageURL:(NSURL * _Nullable )imageURL{
    if (self = [super init]) {
        _userAttributes = [NSMutableDictionary new];
        _userName = userName;
        _imageURL = imageURL;
    }
    return self;
}


@end
