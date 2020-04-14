workspace "ArronEngine"
    architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

startproject "Sandbox"

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
		"%{prj.name}/vendor/spdlog/include"
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
        symbols "On"

    filter "configurations:Release"
        defines "AE_RELEASE"
        optimize "On"
        
    filter "configurations:Dist"
        defines "AE_DIST"
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
        symbols "On"

    filter "configurations:Release"
        defines "AE_RELEASE"
        optimize "On"
        
    filter "configurations:Dist"
        defines "AE_DIST"
        optimize "On"
