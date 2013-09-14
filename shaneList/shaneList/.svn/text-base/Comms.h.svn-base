//
//  Comms.h
//  shaneList
//
//  Created by Thanh Tran on 9/10/13.
//  Copyright (c) 2013 Thanh Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommsDelegate <NSObject>
@optional
- (void) commsDidLogin:(BOOL)loggedIn;
@end

@interface Comms : NSObject

+ (void) login:(id<CommsDelegate>)delegate;

@end
