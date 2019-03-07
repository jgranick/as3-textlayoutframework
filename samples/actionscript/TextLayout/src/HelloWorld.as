////////////////////////////////////////////////////////////////////////////////
//
// ADOBE SYSTEMS INCORPORATED
// Copyright 2007-2010 Adobe Systems Incorporated
// All Rights Reserved.
//
// NOTICE:  Adobe permits you to use, modify, and distribute this file 
// in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
package {
	import flash.display.Sprite;
	
	import flashx.textLayout.compose.StandardFlowComposer;
	import flashx.textLayout.container.ContainerController;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;

	/** Simplest possible "Hello, World" text example */
	public class HelloWorld extends Sprite
	{
		public function HelloWorld()
		{
			var textFlow:TextFlow = new TextFlow();
			var p:ParagraphElement = new ParagraphElement();
			textFlow.addChild(p);
			
			var span:SpanElement = new SpanElement();
			span.text = "Hello, World";
			span.fontSize = 48;
			p.addChild(span);
			
			textFlow.flowComposer.addController(new ContainerController(this, 400, 200));
			textFlow.flowComposer.updateAllControllers();
		}
	}
}
