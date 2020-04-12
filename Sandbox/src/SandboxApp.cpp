#include <ArronEngine.h>
class Sandbox : public ArronEngine::Application
{
public:
	Sandbox()
	{
	}
	~Sandbox() 
	{
	}
};

ArronEngine::Application* ArronEngine::CreateApplication()
{
	return new Sandbox();
}