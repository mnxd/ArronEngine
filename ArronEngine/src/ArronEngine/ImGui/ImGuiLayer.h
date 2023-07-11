#pragma once
#include "ArronEngine/Layer.h"
#include "ArronEngine/Events/ApplicationEvent.h"
#include "ArronEngine/Events/KeyEvent.h"
#include "ArronEngine/Events/MouseEvent.h"

namespace ArronEngine {
	class ARRONENGINE_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer() = default;

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();
	private:
		float m_Time = 0.0f;
	};
}