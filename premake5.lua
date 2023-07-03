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
IncludeDir["Glad"] = "ArronEngine/vendor/Glad/include"
IncludeDir["ImGui"] = "ArronEngine/vendor/ImGui"

group "Dependencies"
    include "ArronEngine/vendor/glfw"
    include "ArronEngine/vendor/Glad"
    include "ArronEngine/vendor/ImGui"
group ""

project "ArronEngine"
    location "ArronEngine"
    kind "SharedLib"
    language "C++"
    staticruntime "off"

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
		"%{IncludeDir.glfw}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
	}
	links
	{
		"GLFW",
        "Glad",
        "ImGui",
		"opengl32.lib"
	}

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

        defines
        {
            "AE_PLATFORM_WINDOWS",
            "AE_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
        }

    filter "configurations:Debug"
        defines "AE_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "AE_RELEASE"
         runtime "Release"
        optimize "On"
        
    filter "configurations:Dist"
        defines "AE_DIST"
        runtime "Release"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    staticruntime "off"

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
        systemversion "latest"

        defines
        {
            "AE_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "AE_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "AE_RELEASE"
        runtime "Release"
        optimize "On"
        
    filter "configurations:Dist"
        defines "AE_DIST"
        runtime "Release"
        optimize "On"
