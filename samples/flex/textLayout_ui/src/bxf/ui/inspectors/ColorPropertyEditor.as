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
	import bxf.ui.controls.ConflictOverlay;

	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.controls.ColorPicker;
	import mx.events.ColorPickerEvent;
	import mx.events.DropdownEvent;

	public class ColorPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mPicker:mx.controls.ColorPicker;
		private var mConflictOverlay:ConflictOverlay = null;
		private var mChangeNotify:ValueChangeNotifier;
		private var mSelColor:int = 0;
		private var mDropdownOpen:Boolean = false;
		
		public function ColorPropertyEditor(inLabel:String, inColorPropName:String):void
		{
			super(inLabel);
			mChangeNotify = new ValueChangeNotifier(inColorPropName, this);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			if (null == mPicker) {
				mPicker = new mx.controls.ColorPicker();	
				mPicker.width = mPicker.height = 18;
				mPicker.selectedColor = mSelColor;
				mPicker.showTextField = false;
				addChild(mPicker);
				// add another event listener here for when a chicklet is moused over (itemRollOver)
				mPicker.addEventListener(mx.events.ColorPickerEvent.CHANGE, colorChange);
				mPicker.addEventListener(mx.events.ColorPickerEvent.ITEM_ROLL_OVER, colorRollover);
				mPicker.addEventListener(mx.events.DropdownEvent.CLOSE, dropdownClosed);
				mPicker.addEventListener(mx.events.DropdownEvent.OPEN, dropdownOpened);
				mPicker.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			}
		}

		private function dropdownClosed(evt:DropdownEvent):void {
			for(var i:uint = 0; i < systemManager.numChildren; i++) {
				if (mPicker.owns(systemManager.getChildAt(i)))
					systemManager.getChildAt(i).removeEventListener(KeyboardEvent.KEY_DOWN, parentKeyDown);
			}
			mDropdownOpen = false;
			colorChanged();
		}
		
		private function dropdownOpened(evt:DropdownEvent):void {
			for(var i:uint = 0; i < systemManager.numChildren; i++) {
				if (mPicker.owns(systemManager.getChildAt(i)))
					systemManager.getChildAt(i).addEventListener(KeyboardEvent.KEY_DOWN, parentKeyDown);
			}
			mDropdownOpen = true;
		}
		
		private function parentKeyDown(evt:KeyboardEvent):void {
			if (evt.keyCode == Keyboard.DELETE || evt.keyCode == Keyboard.BACKSPACE) {
				evt.stopPropagation();
			}
		}
		
		private function onKeyDown(evt:KeyboardEvent):void {
			if (evt.keyCode == Keyboard.ENTER) {
				if (mDropdownOpen == false) {
					mPicker.open();
					mDropdownOpen = true;
				}
			}
		}
		
		public function setValueAsString(inColor:String, inProperty:String):void {
			if(inColor == "transparent")
			{
				mSelColor = 0xFFFFFF;
			}
			else
			{
				mSelColor = int(inColor);
			}
			if (mPicker)
				mPicker.selectedColor = mSelColor;
			if (mConflictOverlay)
				mConflictOverlay.visible = false;
		}
		
		public function setMultiValue(inValues:Array, inProperty:String):void {
			if (mConflictOverlay == null)
			{
				mConflictOverlay = new ConflictOverlay();
				mPicker.addChild(mConflictOverlay);
				mConflictOverlay.width = mPicker.width;
				mConflictOverlay.height = mPicker.height;
			}
			setValueAsString("0xffffff", inProperty);
			mConflictOverlay.visible = true;
		}

		//  allows live update, before committing with colorChanged
		private function colorRollover(evt:mx.events.ColorPickerEvent):void {
			mChangeNotify.ValueEdited(evt.color);
   		}
   		
		private function colorChange(evt:mx.events.ColorPickerEvent):void {
			mChangeNotify.ValueEdited(evt.color);
			mChangeNotify.ValueCommitted(mPicker.selectedColor);
   		}
   		
		private function colorChanged():void {
			mChangeNotify.ValueCommitted(mPicker.selectedColor);
   		}
	}
}

		
