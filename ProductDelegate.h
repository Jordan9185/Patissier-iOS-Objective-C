//
//  ProductDelegate.h
//  
//
//  Created by Francis Tseng on 2017/9/13.
//
//

#import <Foundation/Foundation.h>

@protocol ProductDelegate <NSObject>

-(void)didGet: (NSMutableArray*)products;

@end
