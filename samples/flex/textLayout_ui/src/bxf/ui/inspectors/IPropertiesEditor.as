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
	import flash.events.IEventDispatcher;
	
	public interface IPropertiesEditor extends IEventDispatcher
	{
		/**An instance of an IPropertiesEditor can be cached and re-used across multiple instances of the same
			object type.  The 'reset()' function is called on an existing property editor when a different
			instance of the component is selected.  The intent is that any internal state related to a previous
			editing session is removed and the editor is in a condition similar to it was upon initial
			construction */
		function reset():void;
		
		function get properties():Object;	// associative array of property IDs and their values. 
		
		function rebuildUI():void;
		
		//function draw():void;	// Use this for any custom drawing. Dynamic renderer needs it; dont' think anyone else does
	}
}
