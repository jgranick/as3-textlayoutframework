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
	
	/**
	 * Used by the property (and soon action argument) editors to communicate changes back
	 * to the client.  As of inital writing, it calls callback functions, but that will be
	 * migrating to events. Consolidating it here makes that easier.  
	 **/
	public class ValueChangeNotifier
	{
		public function ValueChangeNotifier(inPropName:String, dispatcher:IEventDispatcher)
		{
			mPropName = inPropName;
			mDispatcher = dispatcher;
			commitOngoing = false;
		}

		public function ValueEdited(newValue:Object):void
		{
			mDispatcher.dispatchEvent(new PropertyEditEvent(PropertyEditEvent.VALUE_EDITED, mPropName, newValue));
		}
		
		public function ValueCommitted(newValue:Object):void
		{
			// Protect against reentrancy. When doing a commit in response to a keyDown (enter key), we can get a loseFocus that 
			// comes through and commits again, causing the change to made twice. 
			if (!commitOngoing)
			{
				commitOngoing = true;
				mDispatcher.dispatchEvent(new PropertyEditEvent(PropertyEditEvent.VALUE_CHANGED, mPropName, newValue));
				commitOngoing = false;
			}
		}
		
		private var mPropName:String;
		private var mDispatcher:IEventDispatcher;
		private var commitOngoing:Boolean;

	}
}
