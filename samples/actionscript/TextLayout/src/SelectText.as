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
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.edit.SelectionManager;

	/** Simple example of a text component where the text is selectable but not editable.  */
	public class SelectText extends Sprite
	{
		public function SelectText()
		{
			var markup:String = "<TextFlow xmlns='http://ns.adobe.com/textLayout/2008'><p><span>Hello, World</span></p></TextFlow>";
			var textFlow:TextFlow = TextConverter.importToFlow(markup, TextConverter.TEXT_LAYOUT_FORMAT);

			textFlow.flowComposer.addController(new ContainerController(this, 200, 50));
			textFlow.flowComposer.updateAllControllers();
			
			textFlow.interactionManager = new SelectionManager();
		}
	}
}
