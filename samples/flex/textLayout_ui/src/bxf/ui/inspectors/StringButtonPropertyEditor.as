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
	
	import mx.controls.Text;
	import mx.events.FlexEvent;

	public class StringButtonPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;
		
		private var mLabel:mx.controls.Text;
		private var mVal:mx.controls.TextInput;
		private var mValStr:String;
		private var mTooltip:String;
		private	var mCmd:int;
		
		public function StringButtonPropertyEditor(inLabel:String, inPropName:String, inCmd:int, inToolTip:String):void
		{
			super(inLabel);
			mChangeNotify = new ValueChangeNotifier(inPropName, this);
			mCmd = inCmd;
			mTooltip = inToolTip;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			if (mVal == null) {
				mVal = new mx.controls.TextInput();
				mVal.styleName = "HUDStringEditor";  
				if (mTooltip != "") {
					mVal.toolTip = mTooltip;
				}
				addChild(mVal);

				mVal.editable = false;
				mVal.addEventListener(mx.events.FlexEvent.ENTER, onValueChanged);
				mVal.addEventListener( flash.events.MouseEvent.CLICK, onMouseClick);
				mVal.data = mValStr;
			}
		}
		
		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			if (mVal != null) {
				mVal.enabled = value;
			}	
		}
		
		public function setValueAsString(inValue:String, inProperty:String):void {
			mValStr = inValue;
			if (mVal)
				mVal.data = inValue;
		}
		
		public function setMultiValue(inValues:Array, inProperty:String):void {
			trace(this.className + ": Multivalue not supported yet.");
			setValueAsString(inValues[0], inProperty);
		}

		private function onValueChanged(evt:mx.events.FlexEvent):void {
			mChangeNotify.ValueCommitted(mVal.text);
 		}

		private function onMouseClick (mouseEvent: flash.events.MouseEvent):void {
		// sent event to host app -- this should really send command for flex app too, but can't figure out how to get toolbar controller
		// to just send command for flex app
			trace("send command: ", mCmd);
			//ExternalInterface.call(ExternalInterfaceConstants.cExecuteCommand, mCmd);
 		}
	}
}

		
