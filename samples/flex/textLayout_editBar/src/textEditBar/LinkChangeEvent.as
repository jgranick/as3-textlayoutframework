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
	
	public class LinkChangeEvent extends Event
	{
		private var _linkText:String;
		private var _targetText:String;
		private var _extendToOverlappingLinks:Boolean;
		
		public function LinkChangeEvent(type:String, linkText:String, targetText:String, extendToOverlappingLinks:Boolean=false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_linkText = linkText;
			_targetText = targetText;
			_extendToOverlappingLinks = extendToOverlappingLinks;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new LinkChangeEvent(type, _linkText, _targetText, _extendToOverlappingLinks, bubbles, cancelable);
		}
		
		public function get linkText():String
		{ return _linkText; }		
		
		public function get linkTarget():String
		{ return _targetText; }
		
		public function get extendToOverlappingLinks():Boolean
		{ return _extendToOverlappingLinks; }
	}
}
