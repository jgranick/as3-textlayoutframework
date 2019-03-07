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
	public interface IHUDLayoutElement {
		
		/** return the width of the primary label for this property editor */
		function getLabelWidth():int;

		function set maxSiblingLabelWid(inMaxLblWid:int):void;
		
		function set sectionSpacer(inSectionSpacer:Boolean):void;
					
	}
}
