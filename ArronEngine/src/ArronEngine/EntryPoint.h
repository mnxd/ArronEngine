#pragma once

#ifdef AE_PLATFORM_WINDOWS

extern ArronEngine::Application* ArronEngine::CreateApplication();

int main(int argc,char** argv)
{
	ArronEngine::Log::Init();
	AE_CORE_WARN("Initialized Log!");
	int a = 5;
	AE_INFO("Hello! var = {0}",a);

	auto app = ArronEngine::CreateApplication();
	app->Run();
	delete app;
}

#endif