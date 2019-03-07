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
import flash.net.FileReference;

public class FileEvent extends Event
{
	public var fileName:FileReference;
	
	public const FILE_CHOOSE:String = "fileChoose";

	public function FileEvent(newFileName:FileReference, type:String = FILE_CHOOSE,
							  bubbles:Boolean = false,
							  cancelable:Boolean = false)
	{
		super(type, bubbles, cancelable);
		fileName = newFileName;
	}
	
	override public function clone():Event
	{
		return new FileEvent(fileName, type, bubbles, cancelable);
	}
}		// end class
}		// end package
