iOSPagingView
=============

Utility view for combining UIScrollView and UIPageControl

To use it:

PPPagingView *v = [[PPPagingView alloc] initWithFrame:self.view.bounds];

UIView *v1 = [UIView alloc] init];
v1.backgroundColor = [UIColor redColor];

UIView *v2 = [UIView alloc] init];
v2.backgroundColor = [UIColor blueColor];

UIView *v3 = [UIView alloc] init];
v3.backgroundColor = [UIColor yellowColor];

[v addView:v1];
[v addView:v2];
[v addView:v3];

[self.view addSubview:v];
