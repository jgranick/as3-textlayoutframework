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
package bxf.ui.utils
{
	import flash.display.DisplayObject;
	
	/**
	 * Finds the effective stage to be used.  Assumes all DisplayObjects share the same stage so once calculated keep using it.
	 */
	
	public function EffectiveStage(obj:DisplayObject):DisplayObject
	{
		// safe to test for stage existence
		if (_effectiveStage == null && obj && obj.stage)
		{
			// if the stage is accessible lets use it.
			try
			{
				var x:int = obj.stage.numChildren;
				_effectiveStage = obj.stage;
			}
			catch(e:Error)
			{
				// TODO: some way to find the highest level accessible root???
				_effectiveStage = obj.root;
			}
		}
		return _effectiveStage;
	}

}

import flash.display.DisplayObject;
var _effectiveStage:DisplayObject = null;
