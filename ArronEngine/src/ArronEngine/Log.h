#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include <spdlog/fmt/ostr.h>

namespace ArronEngine{
	class ARRONENGINE_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

//core log macros
#define AE_CORE_TRACE(...)		::ArronEngine::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define AE_CORE_INFO(...)		::ArronEngine::Log::GetCoreLogger()->info(__VA_ARGS__)
#define AE_CORE_WARN(...)		::ArronEngine::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define AE_CORE_ERROR(...)		::ArronEngine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define AE_CORE_FATAL(...)		::ArronEngine::Log::GetCoreLogger()->fatal(__VA_ARGS__)

//core log macros
#define AE_TRACE(...)			::ArronEngine::Log::GetClientLogger()->trace(__VA_ARGS__)
#define AE_INFO(...)			::ArronEngine::Log::GetClientLogger()->info(__VA_ARGS__)
#define AE_WARN(...)			::ArronEngine::Log::GetClientLogger()->warn(__VA_ARGS__)
#define AE_ERROR(...)			::ArronEngine::Log::GetClientLogger()->error(__VA_ARGS__)
#define AE_FATAL(...)			::ArronEngine::Log::GetClientLogger()->fatal(__VA_ARGS__)
