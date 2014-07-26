//
//  PPPagingView.m
//  PagingView
//
//  Created by Philip Zhao on 7/26/14.
//  Copyright (c) 2014 PP. All rights reserved.
//

#import "PPPagingView.h"
@interface PPPagingView() <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableOrderedSet *presentedView;
@end

@implementation PPPagingView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    _scrollView.delegate = self;
    
    // UIScrollView will determin which page to show onscreen. Thus this not need
    // to set any delecreating parameters.
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    _presentedView = [NSMutableOrderedSet orderedSet];
    
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
  }
  return self;
}

- (void)addView:(UIView *)view
{
  [view removeFromSuperview];
  [_presentedView addObject:view];
  [_scrollView addSubview:view];
  _pageControl.numberOfPages = _presentedView.count;
}

- (void)removeView:(UIView *)view
{
  [view removeFromSuperview];
  [_presentedView removeObject:view];
  _pageControl.numberOfPages = _presentedView.count;
}

- (void)setContentWantFullsize:(BOOL)contentWantFullsize
{
  if (_contentWantFullsize != contentWantFullsize) {
    _contentWantFullsize = contentWantFullsize;
    [self setNeedsLayout];
  }
}

- (NSInteger)currentPage
{
  return _pageControl.currentPage;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  // layout PageControl. On the bottom of the self
  [_pageControl sizeToFit];
  CGRect pageControlFrame = self.bounds;
  pageControlFrame.origin.y = CGRectGetHeight(self.bounds) - CGRectGetHeight(_pageControl.bounds);
  pageControlFrame.size.height = CGRectGetHeight(_pageControl.bounds);
  _pageControl.frame = pageControlFrame;
  
  // layout scrollView.
  CGRect scrollViewFrame = self.bounds;
  if (!_contentWantFullsize) {
    scrollViewFrame.size.height -= CGRectGetHeight(pageControlFrame);
  }
  _scrollView.frame = scrollViewFrame;
  
  // layout scrollView's contentView
  __block CGRect scrollViewContentFrame = _scrollView.bounds;
  [_presentedView enumerateObjectsUsingBlock:^(UIView *view, NSUInteger index, BOOL *stop) {
    view.frame = scrollViewContentFrame;
    scrollViewContentFrame.origin.x += CGRectGetWidth(scrollViewContentFrame);
  }];
  _scrollView.contentSize = CGSizeMake(_presentedView.count * CGRectGetWidth(_scrollView.bounds), CGRectGetHeight(_scrollView.bounds));
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
  CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
  _pageControl.currentPage = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
}
@end
