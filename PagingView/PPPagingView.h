//
//  PPPagingView.h
//  PagingView
//
//  Created by Philip Zhao on 7/26/14.
//  Copyright (c) 2014 PP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPPagingView : UIView
// cause the pageControl overlay with content view
@property (nonatomic, assign) BOOL contentWantFullsize;
@property (nonatomic, assign, readonly) NSInteger currentPage;

- (void)addView:(UIView *)view;
- (void)removeView:(UIView *)view;

@end
