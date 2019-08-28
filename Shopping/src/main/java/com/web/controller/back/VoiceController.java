package com.web.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("VoiceController")
public class VoiceController {

	@RequestMapping("voice")
	public String voice(String strVoice) {
		//strVoice = "你好，很高兴见到你";
		System.out.println("Speak:"+strVoice+"***==start");
		//VoiceUtil.speak(strVoice);
		System.out.println("over---");
		return "manager/voice";
	}
}
