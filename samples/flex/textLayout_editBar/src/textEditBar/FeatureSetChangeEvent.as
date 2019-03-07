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
import flashx.textLayout.elements.TextFlow;

public class FeatureSetChangeEvent extends Event
{
	public const FEATURE_SET:String = "featureSet";
	
	public var featureSet:String;

	public function FeatureSetChangeEvent(newFeatureSet:String, type:String = FEATURE_SET,
							  bubbles:Boolean = false,
							  cancelable:Boolean = false)
	{
		super(type, bubbles, cancelable);
		featureSet = newFeatureSet;
	}
	override public function clone():Event
	{
		return new FeatureSetChangeEvent(featureSet, type, bubbles, cancelable);
	}
}		// end class
}
