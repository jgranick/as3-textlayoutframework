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
	
	public class GraphicChangeEvent extends Event
	{
		private var _imageLink:String;
		private var _imageWidth:Object;
		private var _imageHeight:Object;
		private var _float:String;
		private var _replaceCurrent:Boolean;	
		
		public function GraphicChangeEvent(type:String, imageLink:String, imageWidth:Object, imageHeight:Object, float:String, replaceCurrent:Boolean = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_imageLink = imageLink;
			_imageWidth = imageWidth;
			_imageHeight = imageHeight;
			_replaceCurrent = replaceCurrent;
			_float = float;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new GraphicChangeEvent(type, _imageLink, _imageWidth, _imageHeight, _float, _replaceCurrent, bubbles, cancelable);
		}
		
		public function get imageLink():String
		{ return _imageLink; }		
		
		public function get imageWidth():Object
		{ return _imageWidth; }
		
		public function get imageHeight():Object
		{ return _imageHeight; }
		
		public function get float():String
		{ return _float; }
		
		public function get replaceCurrent():Boolean
		{ return _replaceCurrent; }
	}
}
