//
//  KGQuartzDrawing.h
//  iOSHelper
//
//  Created by kampfgnu on 2/27/12.
//  Copyright (c) 2012 NOUS. All rights reserved.
//

@interface KGQuartzDrawing : NSObject

+ (void)drawHorizontalLineAtPosition:(CGPoint)position width:(CGFloat)width color:(UIColor *)color;
+ (void)drawVerticalLineAtPosition:(CGPoint)position height:(CGFloat)height color:(UIColor *)color;

+ (void)drawHorizontalSeparatorLineAtPosition:(CGPoint)position width:(CGFloat)width;
+ (void)drawVerticalSeparatorLineAtPosition:(CGPoint)position height:(CGFloat)height;


+ (UIImage *)image:(UIImage *)image withText:(NSString *)text drawAtPosition:(CGPoint)position;
+ (UIImage *)image:(UIImage *)image withText:(NSString *)text drawAtPosition:(CGPoint)position fontSize:(CGFloat)fontSize;
+ (UIImage *)image:(UIImage *)image withText:(NSString *)text drawAtPosition:(CGPoint)position fontSize:(CGFloat)fontSize color:(UIColor *)color;

+ (BOOL)writeThumbnailOfImageAtFilepath:(NSString *)filepath toFilepath:(NSString *)toFilepath size:(CGSize)size;
+ (BOOL)writeThumbnailOfImageData:(NSData *)data toFilepath:(NSString *)toFilepath size:(CGSize)size;
+ (UIImage *)thumbnailOfImageAtFilepath:(NSString *)filepath size:(CGSize)size;
+ (CGImageRef)thumbImageRefFromImageAtFilepath:(NSString *)filepath size:(CGSize)size;
+ (CGImageRef)thumbImageRefFromImageData:(NSData *)data size:(CGSize)size;
+ (BOOL)writeImageRef:(CGImageRef)imageRef toFilepath:(NSString *)toFilepath;

+ (UIImage *)imageOfPdfData:(NSData *)data page:(int)page scale:(CGFloat)scale;
+ (UIImage *)imageOfPage:(CGPDFPageRef)page scale:(CGFloat)scale;

+ (CGSize)cropBoxSizeOfCGPDFPageRef:(CGPDFPageRef)pageRef;
+ (CGSize)cropBoxSizeOfPDFData:(NSData *)data page:(int)page;
+ (CGSize)cropBoxSizeOfFirstPageWithPDFData:(NSData *)data;



@end
