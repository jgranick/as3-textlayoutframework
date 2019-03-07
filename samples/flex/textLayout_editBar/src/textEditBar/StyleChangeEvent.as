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
package textEditBar
{
	import flash.events.Event;
	
	import flashx.textLayout.formats.ITextLayoutFormat;

	public class StyleChangeEvent extends Event
	{
		private var _attrs:Object;
		
		public function StyleChangeEvent(type:String, styleAttrs:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_attrs = styleAttrs;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new StyleChangeEvent(type, _attrs, bubbles, cancelable);
		}
		
		public function get format():ITextLayoutFormat
		{ return _attrs as ITextLayoutFormat; }	
		
		public function get attrs():Object
		{ return _attrs; }
	}
}
