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
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	import flashx.textLayout.compose.IFlowComposer;
	import flashx.textLayout.compose.StandardFlowComposer;
	import flashx.textLayout.container.ContainerController;
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.edit.EditManager;
	import flashx.textLayout.elements.TextFlow;

	/** Simple example of two form fields with editable text.  The text only breaks lines on paragraph ends or hard line breaks.  */
	public class ExplicitFormField extends Sprite
	{
		public function ExplicitFormField()
		{
			super();
			
			addTextSprite(10, 10, 300, 50, "Hello");
			addTextSprite(10, 100, 300, 50, "");
		}
		
		private function addTextSprite(x:Number, y:Number, width:Number, height:Number, text:String = ""):void
		{
			var sprite:Sprite = new Sprite();
			var g:Graphics = sprite.graphics;
			g.beginFill(0xEEEEEE);
			g.drawRect(0, 0, width, height);
			g.endFill();
			sprite.x = x;
			sprite.y = y;
			addChild(sprite);
			
			sprite = new Sprite();
			sprite.x = x;
			sprite.y = y;
			addChild(sprite);
			
			var textFlow:TextFlow = TextConverter.importToFlow(text, TextConverter.PLAIN_TEXT_FORMAT);
			textFlow.interactionManager = new EditManager();
					
			textFlow.fontFamily = "Arial";
			textFlow.fontSize = 20;
			textFlow.lineBreak = "explicit";
			
			textFlow.flowComposer.addController(new ContainerController(sprite,width,height));
			textFlow.flowComposer.updateAllControllers();
		}
	}
}
