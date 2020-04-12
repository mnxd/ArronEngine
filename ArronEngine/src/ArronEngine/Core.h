#pragma once

#ifdef AE_PLATFORM_WINDOWS
	#ifdef AE_BUILD_DLL
		#define ARRONENGINE_API __declspec(dllexport)
	#else
		#define ARRONENGINE_API __declspec(dllimport)
	#endif 
#else
	#error Arron only supports windows!
#endif