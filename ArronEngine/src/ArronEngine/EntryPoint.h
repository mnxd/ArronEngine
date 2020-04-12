#pragma once

#ifdef AE_PLATFORM_WINDOWS

extern ArronEngine::Application* ArronEngine::CreateApplication();

int main(int argc,char** argv)
{
	printf("Arron Engine\n");
	auto app = ArronEngine::CreateApplication();
	app->Run();
	delete app;
}

#endif