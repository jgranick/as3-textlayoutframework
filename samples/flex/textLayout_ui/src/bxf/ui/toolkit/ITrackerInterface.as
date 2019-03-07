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
package bxf.ui.toolkit
{
	import flash.events.MouseEvent;
	
	public interface ITrackerInterface {

		/**	Override to get cursor adjust hook and mouse down. 
		 * @param inMouseEvent mouse info.
		 * @param inCursorAdjust true if this is a mouse up track.*/
		function BeginTracking(inMouseEvent:MouseEvent, inCursorAdjust:Boolean):void;
		
		/**	Override to get mouse move. 
		 * @param inMouseEvent mouse info.*/
		function ContinueTracking(inMouseEvent:MouseEvent):void;
				
		/**	Override to get mouse up. 
		 * @param inMouseEvent mouse info.*/
		function EndTracking(inMouseEvent:MouseEvent):void;
	}
}
