workspace "ArronEngine"
    architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

	startproject "Sandbox"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["glfw"] = "ArronEngine/vendor/glfw/include"

include "ArronEngine/vendor/glfw"



project "ArronEngine"
    location "ArronEngine"
    kind "SharedLib"
    language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "AEpch.h"
	pchsource "ArronEngine/src/AEpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.glfw}"
	}
	links
	{
		"GLFW",
		"opengl32.lib"
	}

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "AE_PLATFORM_WINDOWS",
            "AE_BUILD_DLL",
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "AE_DEBUG"
        buildoptions "/MDd"
        symbols "On"

    filter "configurations:Release"
        defines "AE_RELEASE"
        buildoptions "/MD"
        optimize "On"
        
    filter "configurations:Dist"
        defines "AE_DIST"
        buildoptions "/MD"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

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
        "ArronEngine/src"
    }

    links
    {
        "ArronEngine"
    }
    

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "AE_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "AE_DEBUG"
        buildoptions "/MDd"
        symbols "On"

    filter "configurations:Release"
        defines "AE_RELEASE"
        buildoptions "/MD"
        optimize "On"
        
    filter "configurations:Dist"
        defines "AE_DIST"
        buildoptions "/MD"
        optimize "On"
