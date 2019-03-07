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
	
	/**
	 * Hides the messiness of going and finding the app controller and asking it to localize for us.
	 */
	public function LocalString(val:String):String
	{
		// Just assume it's a zString and return the last bit, for now. 
		if (val != null) {
			var equalSign:Number = val.indexOf("=");
			if (equalSign >= 0 && val.length > 1) {
				return val.substr(equalSign + 1);
			}
		}
		
		return val;
	}

}
