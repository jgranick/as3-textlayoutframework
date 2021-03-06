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
package bxf.ui.controls
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.controls.Image;

	/**
	 * HUDImagePopupControl is an image control with the popup menu functionality. It allows specifying 
	 * a separate control as the owner to be able to position the menu relative to that control. 
	 * */	
	public class HUDImagePopupControl extends HBox {
		private var mListDropDownImg:Class;
		private var mListDropDownBmp:Image;
		private var mValueMenu:BxPopupMenu;
		private var mLabelField:String;
				
		private var mSelValue:String;
		private var isOpen:Boolean;
		
		/** Workaround for bug in Flex 4.0.0.2514. SWFLoader event handler called from within addChild fails if systemMaanger is null. */
		private const workaroundFlexBug:Boolean = true;
		private var imageNeedsAttach:Boolean;
		
	
		public function HUDImagePopupControl(inImageClass:Class, inValues:Array=null, inStyleName:String="bxControls") {
			super();
			
			this.styleName = inStyleName;
			
			this.mListDropDownImg = inImageClass;
			
			mListDropDownBmp = new Image;
			mListDropDownBmp.source = mListDropDownImg;
			this.addEventListener(MouseEvent.CLICK, onPopupClicked);	

			imageNeedsAttach = false;
			if (workaroundFlexBug)
				imageNeedsAttach = true;
			else
				addChild(mListDropDownBmp);
			
			mValueMenu = new BxPopupMenu(this, inValues, mListDropDownBmp);
			mValueMenu.addEventListener(BxPopupMenu.SELECTION_CHANGED, onSelectionChanged);
			
			isOpen = false;
		}
		
		private function checkImageAttach():void
		{
			if (imageNeedsAttach && systemManager != null)
			{
				addChild(mListDropDownBmp);
				imageNeedsAttach = false;				
			}
		}
		public function set values(inArray:Array):void {
			checkImageAttach();
			mValueMenu.hide();
			mValueMenu.values = inArray;
		}

		public function set labelField(inLabelField:String):void {
			checkImageAttach();
			mValueMenu.labelField = inLabelField;
		}

		public function set menuPositionOwner(inMenuPositionOwner:DisplayObject):void {
			checkImageAttach();
			mValueMenu.menuPositionOwner = inMenuPositionOwner;
		}
						
		/** Set to one of the BxPopupMenu.MENU_LOCATION_XXX constants. If not set to a valid value,
		 * defaults to MENU_LOCATION_BELOW. */
		public function set menuPosition(inPosition:String):void {
			checkImageAttach();
			mValueMenu.menuPosition = inPosition;
		}

		public function get selectedItem():Object {
			checkImageAttach();
			return mValueMenu.selectedItemData;	
		}	
        
        public function get popupMenu():BxPopupMenu {
			checkImageAttach();
        	return mValueMenu;
        }
        
        public function get imageButton():Image {
			checkImageAttach();
        	return mListDropDownBmp;
        }
        
        protected function onPopupClicked(evt:MouseEvent):void {
			checkImageAttach();
        	if (isOpen)
        		mValueMenu.hide();
        	else
        		mValueMenu.Open();
        	isOpen = !isOpen;
        }

		protected function onSelectionChanged(evt:Event):void {
			
			checkImageAttach();
			this.dispatchEvent(evt);
			isOpen = false;
		}
		
	}
}
