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
	import mx.events.PropertyChangeEvent;

	public class PropertyEditEvent extends PropertyChangeEvent
	{		
		/// This event type means a temporary change, like you might consume for live feedback
		public static const VALUE_EDITED:String = new String("valueEdited");
		
		/// This event type means a committed change - Enter hit, drage ended, whatever. 
		public static const VALUE_CHANGED:String = new String("valueCommitted");
		
		/// This event type means we have detected that the user is hovering, editing, etc. 
		/// Only "property" may be set in this case
		public static const VALUE_ACTIVE:String = new String("valueActive");
		
		/// This event type means opposite of VALUE_FOCUSSED 
		/// Only "property" may be set in this case
		public static const VALUE_INACTIVE:String = new String("valueInactive");
		
		public function PropertyEditEvent(type:String, property:Object=null, newValue:Object=null)
		{
			// These parts of mx.events.PropertyChangeEvent, we don't currently use
			const bubbles:Boolean = false;
			const cancelable:Boolean = false;
			const kind:String = null;
			const source:Object = null;
			const oldValue:Object = null;
			
			super(type, bubbles, cancelable, kind, property, oldValue, newValue, source);
		}
		
	}
}
