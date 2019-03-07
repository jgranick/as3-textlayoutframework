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
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.compose.StandardFlowComposer;
	import flashx.textLayout.container.ContainerController;
	import flashx.textLayout.edit.SelectionManager;
	import flashx.textLayout.elements.FlowLeafElement;
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.events.DamageEvent;
	import flashx.textLayout.events.FlowElementMouseEvent;

	/** This example demonstrates custom event handling on a LinkElement.  In one case a click handler is added to a LinkElement.  In the other class the click handler is a event:EventName string.  */
	public class CustomLinkEventHandler extends Sprite
	{
		private var textFlow:TextFlow;
		private var pCustomClick:ParagraphElement;
		private var pNamedEvent:ParagraphElement;
		
		private function customClickHandler(e:FlowElementMouseEvent):void
		{
			// change the color of the first span of pCustomClick
			textFlow.addEventListener(DamageEvent.DAMAGE,damageHandler);
			var s:FlowLeafElement = pCustomClick.getFirstLeaf();
			s.color = s.computedFormat.color == 0 ? 0xff0000 : 0;
		}
		public var doCompose:Boolean = false;
		
		private function damageHandler(e:DamageEvent):void
		{
			textFlow.removeEventListener(DamageEvent.DAMAGE,damageHandler);
			doCompose = true;
		}
		
		public function enterFrameHandler(e:Event):void
		{
			if (doCompose)
			{
				textFlow.flowComposer.updateAllControllers();
				doCompose = false;
			}
		}
		
		public function CustomLinkEventHandler()
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			
			textFlow = new TextFlow();
			textFlow.fontSize = 18;
			textFlow.paragraphSpaceBefore = 12;
			var p:ParagraphElement = new ParagraphElement();
			var s:SpanElement = new SpanElement();
			textFlow.addChild(p);
			p.addChild(s);
			s.text = "Demonstrate custom event handlers on LinkElement. \nThe first LinkElement has a custom click handler.";
			
			pCustomClick = new ParagraphElement();
			pCustomClick.fontSize = 24;
			textFlow.addChild(pCustomClick);
			s = new SpanElement();
			s.text = "Custom Click: ";
			pCustomClick.addChild(s);
			var link:LinkElement = new LinkElement();
			link.addEventListener(MouseEvent.CLICK,customClickHandler);
			pCustomClick.addChild(link);
			s = new SpanElement();
			link.addChild(s);
			s.text ="click me for a custom click event.";

			textFlow.flowComposer.addController(new ContainerController(this, stage ? stage.stageWidth : 500, stage ? stage.stageHeight : 500));
			textFlow.flowComposer.updateAllControllers();
			
			textFlow.interactionManager = new SelectionManager();
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
	}
}
