#pragma once
#include "AEpch.h"
#include "ArronEngine/Core.h"
#include "ArronEngine/Events/Event.h"

namespace ArronEngine {
	struct WindowProps
	{
		std::string Title;
		unsigned int Width;
		unsigned int Height;

		WindowProps(const std::string& title = "Arron Engine",
			unsigned int width = 1280,
			unsigned int height = 720)
			:Title(title), Width(width), Height(height)
		{
		}
	};

	//��ʾ��������ϵͳ�Ĵ��ڵĽ���
	class ARRONENGINE_API Window
	{
	public:
		using EventCallbackFn = std::function<void(Event&)>;

		virtual ~Window() {}

		virtual void OnUpdate() = 0;

		virtual unsigned int GetWidth() const = 0;
		virtual unsigned int GetHeight() const = 0;

		//Window attributes
		virtual void SetEventCallback(const EventCallbackFn& callback) = 0;
		virtual void SetVSync(bool enabled) = 0;
		virtual bool IsVSync() const = 0;

		virtual void* GetNativeWindow() const = 0;

		static Window* Create(const WindowProps& props = WindowProps());
	};
}