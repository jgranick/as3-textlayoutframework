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
	import flash.events.MouseEvent;
	
	public interface IMouseCapture
	{
		
		function BeginTracking(inMouseEvent:MouseEvent, inCursorAdjust:Boolean):void;
		function ContinueTracking(inMouseEvent:MouseEvent):void;
		function EndTracking(inMouseEvent:MouseEvent):void;
	}
}
