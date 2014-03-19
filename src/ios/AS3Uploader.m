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

- (void)stopRecording:(CDVInvokedUrlCommand*)cmd
{
    [self.commandDelegate runInBackground:^{
        _command = cmd;
        CDVPluginResult *pluginResult =  [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:_command.callbackId];
        
    }];
}


@end
