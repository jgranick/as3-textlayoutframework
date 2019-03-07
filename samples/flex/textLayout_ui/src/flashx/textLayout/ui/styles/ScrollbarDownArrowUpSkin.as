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
package flashx.textLayout.ui.styles
{
	import mx.skins.RectangularBorder;

	public class ScrollbarDownArrowUpSkin extends RectangularBorder
	{
		public function ScrollbarDownArrowUpSkin()
		{
			super();
		}
		
		override public function get measuredWidth():Number
		{
			return 13;
		}
		
		override public function get measuredHeight():Number
		{
			return 14;
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
		}
	}
}
