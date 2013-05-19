#import "UIView+KGAnimations.h"

#define kKGFadeDuration     0.3

@implementation UIView (KGAnimations)

- (void)removeWithTransition:(UIViewAnimationTransition)transition duration:(NSTimeInterval)duration {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:duration];
	[UIView setAnimationTransition:transition forView:self.superview cache:YES];
    
	[self removeFromSuperview];
    
	[UIView commitAnimations];
}

- (void)addSubview:(UIView *)view withTransition:(UIViewAnimationTransition)transition duration:(NSTimeInterval)duration {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:duration];
	[UIView setAnimationTransition:transition forView:self cache:YES];
    
	[self addSubview:view];
    
	[UIView commitAnimations];
}

- (void)setFrame:(CGRect)frame duration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration
                          delay:0.0 
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.frame = frame;
                     } completion:nil];
}

- (void)setAlpha:(CGFloat)alpha duration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration
                          delay:0.0 
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.alpha = alpha;
                     } completion:nil];
}

- (void)fadeIn {
    [self setAlpha:1.f duration:kKGFadeDuration];
}

- (void)fadeOut {
	[self setAlpha:0.f duration:kKGFadeDuration];
}

- (void)fadeOutAndRemoveFromSuperview {
	[UIView animateWithDuration:kKGFadeDuration
                          delay:0.0 
                        options:UIViewAnimationOptionAllowUserInteraction 
                     animations:^{
                         self.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

@end
