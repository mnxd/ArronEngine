#pragma once

#include "Core.h"
#include "Events/Event.h"
#include "Window.h"
#include "ArronEngine/Events/ApplicationEvent.h"

namespace ArronEngine{

	class ARRONENGINE_API Application
	{
	public:
		Application();
		virtual ~Application();

		void OnEvent(Event& e);
		void Run();
	private:
		bool OnWindowClosed(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};
	//To be defined in CLIENT
	Application* CreateApplication();
}
