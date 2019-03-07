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
package flashx.textLayout.ui.rulers
{
	import mx.messaging.management.Attribute;
	
	import flashx.textLayout.formats.ITabStopFormat;
	
	public class TabMarker extends RulerMarker implements ITabStopFormat
	{
		public function TabMarker(inRuler:RulerBar, tabAttrs:ITabStopFormat)
		{
			super(inRuler, 9, 10, -4, 0, Number(tabAttrs.position));
			mTabKind = tabAttrs.alignment;
			mAlignmentToken = tabAttrs.decimalAlignmentToken;
			setStyle("tabkind", mTabKind);
		}
		
		public function get alignment():*
		{
			return mTabKind;
		}
		
		public function set alignment(inAlignment:String):void
		{
			mTabKind = inAlignment;
			setStyle("tabkind", mTabKind);
		}
		
		public function get decimalAlignmentToken():*
		{
			return mAlignmentToken;
		}
		
		public function set decimalAlignmenyToken(inToken:String):void
		{
			mAlignmentToken = inToken;
		}
		
		public function set decimalAlignmentToken(inToken:String):void
		{
			mAlignmentToken = inToken;
		}
		
		public function get position():*
		{
			return pos;
		}
		
		public function set position(inPosition:Object):void
		{
			pos = inPosition as Number;
		}
		
		
		public function isDifferentPosition(element:*, index:int, arr:Array):Boolean
		{
			var other:TabMarker = element as TabMarker;
			if (other)
				return other.position != position;
			else
				return true;
		}
		

		private var mTabKind:String;
		private var mAlignmentToken:String = null;
	}
}
