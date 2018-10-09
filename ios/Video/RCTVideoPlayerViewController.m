#import "RCTVideoPlayerViewController.h"

@interface RCTVideoPlayerViewController ()

@end

@implementation RCTVideoPlayerViewController

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  [_rctDelegate videoPlayerViewControllerWillDismiss:self];
  [_rctDelegate videoPlayerViewControllerDidDismiss:self];
}

#if !TARGET_OS_TV
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
  
  if ([self.preferredOrientation.lowercaseString isEqualToString:@"landscape"]) {
    return UIInterfaceOrientationMaskLandscape;
  }
  else if ([self.preferredOrientation.lowercaseString isEqualToString:@"portrait"]) {
    return UIInterfaceOrientationMaskPortrait;
  }
  return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
  if ([self.preferredOrientation.lowercaseString isEqualToString:@"landscape"]) {
    return UIInterfaceOrientationLandscapeRight;
  }
  else if ([self.preferredOrientation.lowercaseString isEqualToString:@"portrait"]) {
    return UIInterfaceOrientationPortrait;
  }
  else { // default case
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    return orientation;
  }
}
#endif

@end
