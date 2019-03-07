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
package bxf.ui.inspectors
{
	import flash.events.MouseEvent;
	import flash.external.*;
	//import ControllerInterface.ExternalInterfaceConstants;
	
	import mx.controls.Button;
	
	public class PictureButtonPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mButton:Button;
		private var mStyle:String;
		private var mTooltip:String;
		private var mCmd:int;
		
		public function PictureButtonPropertyEditor(inCmd:int, inStyle:String, inTooltip:String)
		{
			// style specifies all skins!
			// inCmd is cmd to send when clicked
			super("");
			mStyle = inStyle;
			mCmd = inCmd;
			mTooltip = inTooltip;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			if (mButton == null) {
				mButton = new Button();

				if (mStyle != "")
				{
					mButton.styleName = mStyle;
				}
				addChild(mButton);
				if (mTooltip != "") {
					mButton.toolTip = mTooltip;
				}
				mButton.addEventListener( flash.events.MouseEvent.CLICK, onMouseClick);
			}
		}
		
		private function onMouseClick (mouseEvent: flash.events.MouseEvent):void {
		// sent event to host app -- this should really send command for flex app too, but can't figure out how to get toolbar controller
		// to just send command for flex app
			trace("send command: ", mCmd);
			//ExternalInterface.call(ExternalInterfaceConstants.cExecuteCommand, mCmd);
 		}

		
		public function setValueAsString(inValue:String, inProperty:String):void {
			// do nothing for this
		}
		
		
		public function setMultiValue(inValues:Array, inProperty:String):void {
			trace(this.className + ": Multivalue not supported yet.");
			setValueAsString(inValues[0], inProperty);
		}
	}
}

