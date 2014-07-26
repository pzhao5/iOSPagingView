//
//  PPViewController.m
//  PagingView
//
//  Created by Philip Zhao on 7/26/14.
//  Copyright (c) 2014 PP. All rights reserved.
//

#import "PPViewController.h"
#import "PPPagingView.h"
@interface PPViewController ()

@end

@implementation PPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  PPPagingView *p = [[PPPagingView alloc] initWithFrame:self.view.bounds];
  p.contentWantFullsize = YES;
  p.backgroundColor = [UIColor brownColor];
  [self.view addSubview:p];
  UIView *c1 = [[UIView alloc] initWithFrame:CGRectZero];
  c1.backgroundColor = [UIColor greenColor];
  UIView *c2 = [[UIView alloc] initWithFrame:CGRectZero];
  c2.backgroundColor = [UIColor yellowColor];
  UIView *c3 = [[UIView alloc] initWithFrame:CGRectZero];
  c3.backgroundColor = [UIColor blueColor];
  [p addView:c1];
  [p addView:c2];
  [p addView:c3];
}
@end
