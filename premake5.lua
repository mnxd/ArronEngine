workspace "ArronEngine"
	architecture "x64"
	startproject "Sandbox"
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "ArronEngine/vendor/GLFW/include"
IncludeDir["Glad"] = "ArronEngine/vendor/Glad/include"
IncludeDir["ImGui"] = "ArronEngine/vendor/imgui"
IncludeDir["glm"] = "ArronEngine/vendor/glm"
include "ArronEngine/vendor/GLFW"
include "ArronEngine/vendor/Glad"
include "ArronEngine/vendor/imgui"
project "ArronEngine"
	location "ArronEngine"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	pchheader "AEpch.h"
	pchsource "ArronEngine/src/AEpch.cpp"
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl",
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links 
	{ 
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"
		defines
		{
			"AE_PLATFORM_WINDOWS",
			"AE_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

	filter "configurations:Debug"
		defines "AE_DEBUG"
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		defines "AE_RELEASE"
		runtime "Release"
		optimize "on"
	filter "configurations:Dist"
		defines "AE_DIST"
		runtime "Release"
		optimize "on"
project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	includedirs
	{
		"ArronEngine/vendor/spdlog/include",
		"ArronEngine/src",
		"ArronEngine/vendor",
		"%{IncludeDir.glm}"
	}

	links
	{
		"ArronEngine"
	}
	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"
		defines
		{
			"AE_PLATFORM_WINDOWS"
		}
	filter "configurations:Debug"
		defines "AE_DEBUG"
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		defines "AE_RELEASE"
		runtime "Release"
		optimize "on"
	filter "configurations:Dist"
		defines "AE_DIST"
		runtime "Release"
		optimize "on"