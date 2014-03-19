//
//  AS3Uploader.m
//  AS3Uploader
//
//  Created by Nilaf Talapady on 19/03/14.
//  Copyright (c) 2014 Nilaf Talapady. All rights reserved.
//

#import "AS3Uploader.h"

@implementation AS3Uploader

//Cordova


-(void)uploadFile:(NSString*)path{
    AFAmazonS3Manager *s3Client = [[AFAmazonS3Manager alloc] initWithAccessKeyID:accessId secret:secretKey];
    s3Client.requestSerializer.bucket = bucket;

    s3Client.requestSerializer.timeoutInterval = 240;
    [s3Client postObjectWithFile:path
                 destinationPath:@"/"
                      parameters:nil
                        progress:^(NSUInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
                            double progress = (totalBytesWritten / (totalBytesExpectedToWrite * 1.0f) * 100);
                            CDVPluginResult *pluginResult =  [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:progress];
                            [self.commandDelegate sendPluginResult:pluginResult callbackId:_command.callbackId];
                        }
                         success:^(id responseObject) {
                             CDVPluginResult *pluginResult =  [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Success"];
                             [pluginResult setKeepCallbackAsBool:false];
                             [self.commandDelegate sendPluginResult:pluginResult callbackId:_command.callbackId];

                         }
                         failure:^(NSError *error) {
                             NSLog(@"Error: %@", error);
                         }];
}

- (void)config:(CDVInvokedUrlCommand*)command
{
        
    [self.commandDelegate runInBackground:^{

        accessId = [command.arguments objectAtIndex:0];
        secretKey = [command.arguments objectAtIndex:1];
        bucket = [command.arguments objectAtIndex:2];
        CDVPluginResult *pluginResult =  [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:_command.callbackId];
        
    }];
}
- (void)upload:(CDVInvokedUrlCommand*)command
{
    
    [self.commandDelegate runInBackground:^{
        _command = command;
        
        NSString *path = [command.arguments objectAtIndex:0];
        [self uploadFile:path];
        CDVPluginResult *pluginResult =  [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
        [pluginResult setKeepCallbackAsBool:true];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:_command.callbackId];
        
    }];
}


@end
