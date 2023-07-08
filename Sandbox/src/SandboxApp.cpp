#include <ArronEngine.h>

#include "imgui/imgui.h"

class ExampleLayer : public ArronEngine::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		if (ArronEngine::Input::IsKeyPressed(AE_KEY_TAB))
			AE_TRACE("Tab key is pressed (poll)!");
	}

	virtual void OnImGuiRender() override
	{
		ImGui::Begin("Test");
		ImGui::Text("Hello World");
		ImGui::End();
	}

	void OnEvent(ArronEngine::Event& event) override
	{
		if (event.GetEventType() == ArronEngine::EventType::KeyPressed)
		{
			ArronEngine::KeyPressedEvent& e = (ArronEngine::KeyPressedEvent&)event;
			if (e.GetKeyCode() == AE_KEY_TAB)
				AE_TRACE("Tab key is pressed (event)!");
			AE_TRACE("{0}", (char)e.GetKeyCode());
		}
	}

};

class Sandbox : public ArronEngine::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}
	~Sandbox() 
	{
	}
};

ArronEngine::Application* ArronEngine::CreateApplication()
{
	return new Sandbox();
}