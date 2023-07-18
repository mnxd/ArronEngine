#include "AEpch.h"
#include "RenderCommand.h"

#include "Platform/OpenGL/OpenGLRendererAPI.h"

namespace ArronEngine {

	RendererAPI* RenderCommand::s_RendererAPI = new OpenGLRendererAPI;

}