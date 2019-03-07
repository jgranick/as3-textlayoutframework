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
package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import flashx.textLayout.container.*;
	import flashx.textLayout.elements.*;
	import flashx.textLayout.events.StatusChangeEvent;

	/** Hell world text example with an inline graphic */
	public class InlineGraphic extends Sprite
	{
		private var _textFlow:TextFlow;
		
		public function InlineGraphic()
		{
			_textFlow = new TextFlow();
			_textFlow.fontSize = 48;
			var p:ParagraphElement = new ParagraphElement();
			_textFlow.addChild(p);
			
			var span:SpanElement = new SpanElement();
			span.text = "Hello ";
			p.addChild(span);
			
			// InlineGraphicElement has "auto" width/height so the size can't be calculated till the graphic is loaded
			var inlineGraphic:InlineGraphicElement = new InlineGraphicElement();
			inlineGraphic.source = "http://www.adobe.com/shockwave/download/images/flashplayer_100x100.jpg";
			p.addChild(inlineGraphic);
			
			var span2:SpanElement = new SpanElement();
			span2.text = " World";
			p.addChild(span2);
			
			// event sent when graphic is done loading
			_textFlow.addEventListener(StatusChangeEvent.INLINE_GRAPHIC_STATUS_CHANGE,graphicStatusChangeEvent);

			_textFlow.flowComposer.addController(new ContainerController(this,400,200));
			
			// this call compose but the graphic hasn't been loaded from the source URL yet.
			// The actualWidth and actualHeight are zero.  
			_textFlow.flowComposer.updateAllControllers();
		}	
		

		private function graphicStatusChangeEvent(e:StatusChangeEvent):void
		{
			// if the graphic has loaded update the display
			// actualWidth and actualHeight are computed from the graphic's height
			if (e.status == InlineGraphicElementStatus.READY || e.status == InlineGraphicElementStatus.SIZE_PENDING)
			{
				_textFlow.flowComposer.updateAllControllers();
			}
		}
	}
}
