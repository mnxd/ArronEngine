#include "AEpch.h"

#include "Application.h"

#include "ArronEngine/Events/ApplicationEvent.h"
#include "ArronEngine/Log.h"

namespace ArronEngine
{
	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			AE_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			AE_TRACE(e);
		}

		while (true);
	}
}