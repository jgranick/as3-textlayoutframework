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
package flashx.textLayout.ui.inspectors
{
	import flash.events.Event;

	public class SelectionUpdateEvent extends Event
	{
		public static const SELECTION_UPDATE:String = "selectionUpdate";
		
		public function SelectionUpdateEvent(inFormat:Object)
		{
			super(SELECTION_UPDATE);
			mFormat = inFormat;
		}
		
		public function get format():Object
		{
			return mFormat;
		}
		
		private var mFormat:Object;
	}
}
