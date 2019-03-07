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
	
	import mx.containers.Canvas;
	import mx.controls.CheckBox;
	
	/* The simple checkbox property editor keeps the label to the right of the
		control and doesn't partipate in any dynamic label sizing */
	public class SimpleCheckboxPropertyEditor extends Canvas implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;

		//private var mLabel:mx.controls.Text;
		private var mCheckbox:CheckBox;
					
		public function SimpleCheckboxPropertyEditor(inLabel:String, inPropName:String)
		{
			super();

			mChangeNotify = new ValueChangeNotifier(inPropName, this);

			mCheckbox = new CheckBox();
			mCheckbox.label = inLabel;
			addChild(mCheckbox);
   
			mCheckbox.addEventListener(MouseEvent.CLICK, onMouseClick);			
		}
		

		public function onMouseClick(inEvt:MouseEvent):void {
			mChangeNotify.ValueCommitted(mCheckbox.selected ? "true" : "false");
		}
		
		public function setValueAsString(inValue:String, inProperty:String):void {
			mCheckbox.selected = Boolean(inValue == "true");
		}
				
		public function setMultiValue(inValues:Array, inProperty:String):void {
			trace(this.className + ": Multivalue not supported yet.");
			setValueAsString(inValues[0], inProperty);
		}
	}
}

		
