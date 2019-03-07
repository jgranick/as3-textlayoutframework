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
	import flash.events.FocusEvent;
	
	import mx.controls.Text;
	import mx.events.FlexEvent;

	public class StringPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;
		
		private var mLabel:mx.controls.Text;
		private var mVal:mx.controls.TextInput;
		private var mFieldWid:int;
		private var mValStr:String;
		
		
		public function StringPropertyEditor(inLabel:String, inPropName:String, inFieldWid:int = 36):void
		{
			super(inLabel);
			mChangeNotify = new ValueChangeNotifier(inPropName, this);
			mFieldWid = inFieldWid;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			if (mVal == null) {
				mVal = new mx.controls.TextInput();
				mVal.styleName = "stringPropertyEditor";
				mVal.setStyle("fontFamily", "_sans"); 				
				
				addChild(mVal);

				mVal.width = mFieldWid;
				mVal.addEventListener(mx.events.FlexEvent.ENTER, onValueChanged);
				mVal.addEventListener( flash.events.FocusEvent.FOCUS_OUT, onLoseFocus);
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

		private function onLoseFocus(change: flash.events.FocusEvent):void {
			mChangeNotify.ValueCommitted(mVal.text);
 		}
	}
}

		
