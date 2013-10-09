#import <QuartzCore/QuartzCore.h>
#import "UIView+KGAdditions.h"
#import "UIColor+KGAdditions.h"
#import "CGGeometry+KGAdditions.h"

@implementation UIView (KGAdditions)

////////////////////////////////////////////////////////////////////////
#pragma mark - Frame/Bounds
////////////////////////////////////////////////////////////////////////

- (void)setIntegralCenter:(CGPoint)integralCenter {
    self.center = integralCenter;
    self.frame = CGRectIntegral(self.frame);
}

- (CGPoint)integralCenter {
    return self.center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)setIntegralFrame:(CGRect)integralFrame {
    self.frame = CGRectIntegral(integralFrame);
}

- (CGRect)integralFrame {
    return CGRectIntegral(self.frame);
}

- (void)setFrameOrigin:(CGPoint)frameOrigin {
    self.frame = KGRectSetOrigin(self.frame, frameOrigin);
}

- (CGPoint)frameOrigin {
    return self.frame.origin;
}

- (void)setFrameSize:(CGSize)frameSize {
    self.frame = KGRectSetSize(self.frame, frameSize);
}

- (CGSize)frameSize {
    return self.frame.size;
}

- (void)setFrameWidth:(CGFloat)width {
    self.frame = KGRectSetWidth(self.frame, width);
}

- (void)setFrameHeight:(CGFloat)height {
    self.frame = KGRectSetHeight(self.frame, height);
}

- (void)setFrameTop:(CGFloat)top {
    self.frame = KGRectSetY(self.frame, top);
}

- (void)setFrameLeft:(CGFloat)left {
    self.frame = KGRectSetX(self.frame, left);
}

- (void)setFrameBottom:(CGFloat)bottom {
	self.frame = CGRectMake(self.frame.origin.x,bottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameRight:(CGFloat)right {
	self.frame = CGRectMake(right - self.frame.size.width,self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)frameHeight {
	return CGRectGetHeight(self.frame);
}

- (CGFloat)frameWidth {
	return CGRectGetWidth(self.frame);
}

- (CGFloat)frameTop {
	return CGRectGetMinY(self.frame);
}

- (CGFloat)frameLeft {
	return CGRectGetMinX(self.frame);
}

- (CGFloat)frameBottom {
	return CGRectGetMaxY(self.frame);
}

- (CGFloat)frameRight {
	return CGRectGetMaxX(self.frame);
}

- (CGFloat)boundsWidth {
    return CGRectGetWidth(self.bounds);
}

- (CGFloat)boundsHeight {
    return CGRectGetHeight(self.bounds);
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Relative Positioning
////////////////////////////////////////////////////////////////////////

- (void)positionUnderView:(UIView *)view {
	[self positionUnderView:view padding:0.f];
}

- (void)positionUnderView:(UIView *)view padding:(CGFloat)padding {
	[self positionUnderView:view padding:padding alignment:KGUIViewAlignmentUnchanged];
}

- (void)positionUnderView:(UIView *)view alignment:(KGUIViewAlignment)alignment {
	[self positionUnderView:view padding:0.f alignment:alignment];
}

- (void)positionUnderView:(UIView *)view padding:(CGFloat)padding alignment:(KGUIViewAlignment)alignment {
	self.frameTop = view.frameBottom + padding;
    
	switch (alignment) {
		case KGUIViewAlignmentLeftAligned:
			self.frameLeft = view.frameLeft;
			break;
            
		case KGUIViewAlignmentRightAligned:
			self.frameRight = view.frameRight;
			break;
            
		case KGUIViewAlignmentCentered:
			self.centerX = view.centerX;
			break;
            
        case KGUIViewAlignmentUnchanged:
        case KGUIViewAlignmentTopAligned:
        case KGUIViewAlignmentBottomAligned:
        default:
			// do nothing
			break;
	}
}

- (void)positionNextToView:(UIView *)view {
	[self positionNextToView:view padding:0.f];
}

- (void)positionNextToView:(UIView *)view padding:(CGFloat)padding {
	[self positionNextToView:view padding:padding alignment:KGUIViewAlignmentUnchanged];
}

- (void)positionNextToView:(UIView *)view alignment:(KGUIViewAlignment)alignment {
	[self positionNextToView:view padding:0.f alignment:alignment];
}

- (void)positionNextToView:(UIView *)view padding:(CGFloat)padding alignment:(KGUIViewAlignment)alignment {
	self.frameLeft = view.frameRight + padding;
    
	switch (alignment) {
		case KGUIViewAlignmentTopAligned:
			self.frameTop = view.frameTop;
			break;
            
		case KGUIViewAlignmentBottomAligned:
			self.frameBottom = view.frameBottom;
			break;
            
		case KGUIViewAlignmentCentered:
			self.centerY = view.centerY;
			break;
            
        case KGUIViewAlignmentUnchanged:
        case KGUIViewAlignmentLeftAligned:
        case KGUIViewAlignmentRightAligned:
        default:
			// do nothing
			break;
	}
}

- (void)addCenteredSubview:(UIView *)subview {
	[self addSubview:subview];
    [subview moveToCenterOfSuperview];
}

- (void)moveToCenterOfSuperview {
	self.center = CGPointMake(self.superview.boundsWidth/2.f, self.superview.boundsHeight/2.f);
}

- (void)moveToCenterOfSuperviewHorizontally {
	self.center = CGPointMake(self.superview.boundsWidth/2.f, self.center.y);
}

- (void)moveToCenterOfSuperviewVertically {
	self.center = CGPointMake(self.center.x, self.superview.boundsHeight/2.f);
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Shadows/Borders
////////////////////////////////////////////////////////////////////////

- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self setBorderWidth:borderWidth borderColor:borderColor cornerRadius:0.f];
}

- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius {
	CALayer *layer = self.layer;
    
	layer.masksToBounds = YES;
	layer.cornerRadius = cornerRadius;
	layer.borderWidth = borderWidth;
	layer.borderColor = [borderColor CGColor];
}

- (void)setShadowWithOffset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity {
    CALayer *layer = self.layer;
    
	layer.masksToBounds = NO;
	layer.shadowOffset = offset;
	layer.shadowRadius = radius;
	layer.shadowOpacity = opacity;
}

- (void)setGradientBackgroundWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
	CAGradientLayer *gradient = [CAGradientLayer layer];
    
	gradient.frame = self.bounds;
	gradient.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    
	[self.layer insertSublayer:gradient atIndex:0];
}

- (void)enableDebugBorderWithColor:(UIColor *)color {
//    KGLogDebug(@"[Enabling debug border for view %@]", self);
    
#ifdef KG_DEBUG
    [self setBorderWidth:2.f borderColor:color];
#endif
}

- (void)enableDebugBorderWithRandomColor {
	[self enableDebugBorderWithColor:[UIColor randomColor]];
}

- (void)enableDebugBorder {
	[self enableDebugBorderWithColor:[UIColor orangeColor]];
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Gestures
////////////////////////////////////////////////////////////////////////

- (void)removeAllGestureRecognizers {
    for (UIGestureRecognizer *gestureRecognizer in self.gestureRecognizers) {
        [self removeGestureRecognizer:gestureRecognizer];
    }
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Image Representation
////////////////////////////////////////////////////////////////////////

- (UIImage *)imageRepresentation {
	UIGraphicsBeginImageContext(self.bounds.size);
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
    return image;
}

- (UIImage *)darkerImageRepresentation {
	UIImage *image = [self imageRepresentation];
	
    return [UIView darkenImage:image];
}

+ (UIImage *)darkenImage:(UIImage *)image {
    UIGraphicsBeginImageContext(image.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -area.size.height);
    
    CGContextSaveGState(context);
    CGContextClipToMask(context, area, image.CGImage);
    
    [[[UIColor blackColor] colorWithAlphaComponent:0.5] set];
    CGContextFillRect(context, area);
    
    CGContextRestoreGState(context);
    
    CGContextSetBlendMode(context, kCGBlendModeMultiply);
    
    CGContextDrawImage(context, area, image.CGImage);
    
    UIImage *colorizedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return colorizedImage;
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Scrolling
////////////////////////////////////////////////////////////////////////

+ (void)disableScrollsToTopOnAllSubviewsOfView:(UIView *)view {
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subview).scrollsToTop = NO;
        }
        
        [self disableScrollsToTopOnAllSubviewsOfView:subview];
    }
}

- (void)disableScrollsToTopOnAllSubviews {
    [UIView disableScrollsToTopOnAllSubviewsOfView:self];
}

@end
