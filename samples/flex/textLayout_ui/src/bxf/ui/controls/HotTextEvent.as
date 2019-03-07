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
	import flash.events.Event;

	public class HotTextEvent extends Event
	{
		public static const CHANGE:String = "change";	
		public static const FINISH_CHANGE:String = "finishChange";	
		public static const ACTIVE:String = "active";
		public static const INACTIVE:String = "inactive";	
		
	/**
     *  The new value of the HotText. 
      */
    	public var value:Object;
    	
        public function HotTextEvent(type:String, value:Object = null,
	    							bubbles:Boolean = false,
	                                cancelable:Boolean = false,
	                                triggerEvent:Event = null,
	                                clickTarget:String = null, keyCode:int = -1)
	    {
	        super(type, bubbles, cancelable);
        	this.value = value;
        }
	    
	}
}
