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
	
	import flashx.textLayout.container.ContainerController;
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.events.FlowElementMouseEvent;
	
	[SWF(width="500", height="500")]
	public class LinkEventExample extends Sprite
	{
		public const markup:String = '<TextFlow xmlns="http://ns.adobe.com/textLayout/2008" fontSize="24"><p>Text that includes a link to ' +
			'<a href="event:changeTextFlowColor">custom event code</a>. ' +
			'Clicking the link changes the default color of the TextFlow.</p></TextFlow>';
		
		public function LinkEventExample()
		{
			var textFlow:TextFlow = TextConverter.importToFlow(markup,TextConverter.TEXT_LAYOUT_FORMAT);
			textFlow.addEventListener("changeTextFlowColor",changeTextFlowColor)
         
            textFlow.flowComposer.addController(new ContainerController(this,stage ? stage.stageWidth : 500, stage ? stage.stageHeight : 500));
            textFlow.flowComposer.updateAllControllers();
		}

		private function changeTextFlowColor(e:FlowElementMouseEvent):void
		{
			var textFlow:TextFlow = e.flowElement.getTextFlow();
			textFlow.color = textFlow.color == 0x00ff00 ? 0 : 0x00ff00;
			textFlow.flowComposer.updateAllControllers();
		}
	}
}

