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
	
	import mx.containers.HBox;
	import mx.controls.CheckBox;
	import mx.controls.Spacer;
	
	public class CheckboxPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mChangeNotify:ValueChangeNotifier;
		private var mSelected:Boolean;
		
		private var mCheckbox:CheckBox;
		private var mHangingIndent:Boolean;
		private var mAlternateLabel:String;		// valid if hanging indent trick mode is on
					
		public function CheckboxPropertyEditor(inLabel:String, inPropName:String, inHangingIndent:Boolean = false, inSectionLabel:String = " ")
		{
			super(inHangingIndent ? inSectionLabel : inLabel);
			setStyle("verticalAlign", "middle");

			mChangeNotify = new ValueChangeNotifier(inPropName, this);
			
			mHangingIndent = inHangingIndent;
			mAlternateLabel = inLabel;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			if (mCheckbox == null) {

				mCheckbox = new CheckBox();
					
				if (!mHangingIndent)
				{
					addChild(mCheckbox);
				}
				else
				{
					mCheckbox.label = mAlternateLabel;
					var newHBox:HBox = new HBox();
					newHBox.setStyle("horizontalGap", 0);
					var s:Spacer = new Spacer();
					s.width = 4;
					newHBox.addChild(s);
					newHBox.addChild(mCheckbox);
					addChild(newHBox);
				}

				mCheckbox.selected = mSelected;
				mCheckbox.addEventListener(MouseEvent.CLICK, onMouseClick);			
			}
		}		

		public function onMouseClick(inEvt:MouseEvent):void {
			mChangeNotify.ValueCommitted(mCheckbox.selected ? "true" : "false");
		}
		
		public function setValueAsString(inValue:String, inProperty:String):void {
			mSelected = Boolean(inValue == "true");
			if (mCheckbox)
				mCheckbox.selected = mSelected;
		}
		
		public function setMultiValue(inValues:Array, inProperty:String):void {
			trace(this.className + ": Multivalue not supported yet.");
			setValueAsString(inValues[0], inProperty);
		}
		
	}
}

		
