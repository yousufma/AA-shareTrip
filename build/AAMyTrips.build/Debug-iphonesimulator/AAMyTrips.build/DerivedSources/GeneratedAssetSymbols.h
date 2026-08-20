#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.example.AAMyTrips";

/// The "AccentColor" asset catalog color resource.
static NSString * const ACColorNameAccentColor AC_SWIFT_PRIVATE = @"AccentColor";

/// The "losangeles" asset catalog image resource.
static NSString * const ACImageNameLosangeles AC_SWIFT_PRIVATE = @"losangeles";

/// The "miami" asset catalog image resource.
static NSString * const ACImageNameMiami AC_SWIFT_PRIVATE = @"miami";

/// The "newyork" asset catalog image resource.
static NSString * const ACImageNameNewyork AC_SWIFT_PRIVATE = @"newyork";

#undef AC_SWIFT_PRIVATE
