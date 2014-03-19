//
//  AS3Uploader.h
//  AS3Uploader
//
//  Created by Nilaf Talapady on 19/03/14.
//  Copyright (c) 2014 Nilaf Talapady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

#import "AFAmazonS3Manager.h"


@interface AS3Uploader : CDVPlugin{
    CDVInvokedUrlCommand *_command;
    NSString *accessId,*secretKey,*bucket;
    AFAmazonS3Manager *s3Client;
}

- (void)config:(CDVInvokedUrlCommand*)command;
- (void)upload:(CDVInvokedUrlCommand*)command;
@end
