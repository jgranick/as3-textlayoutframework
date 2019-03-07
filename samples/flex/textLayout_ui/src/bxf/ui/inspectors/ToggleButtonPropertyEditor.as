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
	import flash.events.Event;
	
	import mx.containers.Canvas;
	import mx.controls.Button;
	
	import bxf.ui.controls.ConflictOverlay;
	
	public class ToggleButtonPropertyEditor extends PropertyEditorBase implements IPropertyEditor
	{
		private var mToggleButton:Button;
		private var mConflictOverlay:ConflictOverlay = null;
		private var mOverlayCanvas:Canvas;
		private var mCommitState:Boolean;
		private var mStyle:String;
		private var mLabel:String;
		private var mIcon:Class;
		private var mButtonWidth:Number;
		private var mFalseStr:String;
		private var mTrueStr:String;
		private var mChangeNotify:ValueChangeNotifier;
		private var mValue:Object = null;
		
		public function ToggleButtonPropertyEditor(inLabel:String, inIcon:Class, inPropName:String,
							inFalseStr:String, inTrueStr:String, inCommitState:Boolean, inStyle:String = "",
							inButtonWidth:Number = 0)
		{
			super("");
			mLabel = inLabel;
			mIcon = inIcon;
			mButtonWidth = inButtonWidth;
			mCommitState = inCommitState;
			mStyle = inStyle;
			mFalseStr = inFalseStr ? inFalseStr : "false";
			mTrueStr = inTrueStr ? inTrueStr : "true";
			
			mChangeNotify = new ValueChangeNotifier(inPropName, this);

		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			if (mToggleButton == null) {
				mToggleButton = new Button();

				mToggleButton.toggle = true;
				
				if (mStyle != "")
				{
					mToggleButton.styleName = mStyle;
				}
				
				mToggleButton.height = 16;
				mToggleButton.focusEnabled = false;
	
				mToggleButton.label = mLabel ? mLabel : "";
				if (mIcon)
					mToggleButton.setStyle("icon", mIcon);
				if (mButtonWidth)
					mToggleButton.width = mButtonWidth;

				mOverlayCanvas = new Canvas();
				mOverlayCanvas.setStyle("backgroundAlpha", 0);
				mOverlayCanvas.width = mToggleButton.width;
				mOverlayCanvas.height = mToggleButton.height;
				
				mOverlayCanvas.addChild(mToggleButton);
				addChild(mOverlayCanvas);
				
				mToggleButton.addEventListener(flash.events.MouseEvent.CLICK, onMouseClick);
				if (mValue)
					if (mValue is Array)
						setMultiValue(mValue as Array, "");
					else
						setValueAsString(mValue as String, "");
			}
		}
		
		public function onMouseClick(inEvt:MouseEvent):void {
			
			if (mCommitState)
				mChangeNotify.ValueCommitted(mToggleButton.selected ? mTrueStr : mFalseStr);
			else
				mChangeNotify.ValueEdited(mToggleButton.selected ? mTrueStr : mFalseStr);
			
			this.parentApplication.dispatchEvent(new Event(Event.ACTIVATE));
		}
		
		
		public function setValueAsString(inValue:String, inProperty:String):void {
			mValue = inValue;
			if (mToggleButton)
				mToggleButton.selected = (mValue == mTrueStr);
			if (mConflictOverlay)
				mConflictOverlay.visible = false;
		}
		
		public function setMultiValue(inValues:Array, inProperty:String):void {
			mValue = inValues;
			if (mToggleButton)
			{
				if (mConflictOverlay == null)
				{
					mConflictOverlay = new ConflictOverlay();
					mConflictOverlay.width = mToggleButton.width;
					mConflictOverlay.height = mToggleButton.height;
					mConflictOverlay.x = mToggleButton.x;
					mOverlayCanvas.addChild(mConflictOverlay);
				}
				setValueAsString(mFalseStr, inProperty);
				mConflictOverlay.visible = true;
			}
		}
		
	}
}
