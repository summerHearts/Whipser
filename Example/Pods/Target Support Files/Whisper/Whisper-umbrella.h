#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "whisper-decoder-impl.h"
#import "whisper-encoder-impl.h"
#import "whisper-encoder.h"
#import "ggml-alloc.h"
#import "ggml-backend-impl.h"
#import "ggml-backend.h"
#import "ggml-impl.h"
#import "ggml-metal.h"
#import "ggml-quants.h"
#import "ggml.h"
#import "whisper.h"

FOUNDATION_EXPORT double WhisperVersionNumber;
FOUNDATION_EXPORT const unsigned char WhisperVersionString[];

