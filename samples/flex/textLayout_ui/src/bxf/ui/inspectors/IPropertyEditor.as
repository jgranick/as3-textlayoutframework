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
	
	// dispatches PropertyEditEvents on changes
	public interface IPropertyEditor extends IEventDispatcher
	{	
		function setValueAsString(value:String, inPropType:String):void;	
		/** 
		 * setMultiValue is for use when a multiple selection contains different values
		 * for the property. values should be Array of strings.
		*/
		function setMultiValue(values:Array, inPropType:String):void;		
	}
}
