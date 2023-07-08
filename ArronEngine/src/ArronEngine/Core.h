#pragma once

#ifdef AE_PLATFORM_WINDOWS
#if AE_DYNAMIC_LINK
	#ifdef AE_BUILD_DLL
		#define ARRONENGINE_API __declspec(dllexport)
	#else
		#define ARRONENGINE_API __declspec(dllimport)
	#endif 
#else
	#define ARRONENGINE_API
#endif
#else
	#error Arron only supports windows!
#endif

#ifdef AE_DEBUG
#define AE_ENABLE_ASSERTS
#endif

#ifdef AE_ENABLE_ASSERTS
	#define  AE_ASSERT(x,...){if(!(x)){AE_ERROR("Assertion Faild:{0}",__VA_ARGS__);__debugbreak();}}
	#define  AE_CORE_ASSERT(x,...){if(!(x)){AE_CORE_ERROR("Assertion Faild:{0}",__VA_ARGS__);__debugbreak();}}
#else
	#define AE_ASSERT(x,...)
	#define AE_CORE_ASSERT(x,...)
#endif

#define  BIT(x) (1<<x)
#define AE_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)