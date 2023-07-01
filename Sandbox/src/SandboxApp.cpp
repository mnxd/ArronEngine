#include <ArronEngine.h>
class ExampleLayer : public ArronEngine::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		AE_INFO("ExampleLayer::Update");
	}

	void OnEvent(ArronEngine::Event& event) override
	{
		AE_TRACE("{0}", event);
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