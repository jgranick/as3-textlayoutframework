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
	import flash.events.Event;
	
	import bxf.ui.controls.BxPopupMenu;
	import bxf.ui.controls.HUDComboPopupControl;
	
	public class ComboBoxPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;
		private var mComboBox:HUDComboPopupControl;
		private var mComboBoxStyleName:String;
		private var mAvailVals:Array;
		private var mValueRemap:Object;
		private var mSelectedIdx:int = 0;
		private var mDeferredInitValue:String = null;
						
		public function ComboBoxPropertyEditor(inLabel:String, inPropName:String, inAvailVals:Array, inValueRemap:Object = null) {
			super(inLabel);

			mChangeNotify = new ValueChangeNotifier(inPropName, this);
			mComboBoxStyleName = "comboPropEditorValue";

			mAvailVals = inAvailVals;
			mValueRemap = (inValueRemap != null) ? inValueRemap : new Object();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			if (mComboBox == null) {	
				mComboBox = new HUDComboPopupControl(mAvailVals, mComboBoxStyleName);
				mComboBox.setStyle("paddingTop", 2);

				addChild(mComboBox);

				if (mDeferredInitValue != null && mDeferredInitValue != "")
				{
					mComboBox.value = mDeferredInitValue;
					mDeferredInitValue = null;
				}
				
				// Make sure the app knows that there is a value selected...
				else if (mAvailVals.length > 0)
				{
					var value:Object = mValueRemap[mComboBox.value];
					if (value == null)
						value = mComboBox.value;
		
					mChangeNotify.ValueCommitted(value);
				}
				 
				mComboBox.addEventListener(BxPopupMenu.SELECTION_CHANGED, onComboChanged);
			}		
		}

		private function onComboChanged(inEvt:Event):void {
			var value:Object = mValueRemap[mComboBox.value];
			if (value == null)
				value = mComboBox.value;

			mChangeNotify.ValueCommitted(value);
		}

		public function setValueAsString(inValue:String, inProperty:String):void {
			for (var userString:String in mValueRemap) {
				if (mValueRemap[userString] == inValue) {
					inValue = userString;
					break;
				}
			}
			
			if (mComboBox)
				mComboBox.value = inValue;
			else
				mDeferredInitValue = inValue;
		}

		
		public function setMultiValue(inValues:Array, inProperty:String):void {
			var value:String = "Mixed";
			if (mComboBox)
				mComboBox.value = value;
			else
				mDeferredInitValue = value;
		}
	}
}
