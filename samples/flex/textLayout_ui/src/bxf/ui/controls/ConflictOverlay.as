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
package bxf.ui.controls
{
	import mx.containers.Canvas;

	public class ConflictOverlay extends Canvas
	{
		public function ConflictOverlay()
		{
			super();
		}
		
		protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			graphics.clear();
			graphics.lineStyle(1, 0xffffff, 1.0, true);
			graphics.moveTo(1, unscaledHeight / 2 - 1);
			graphics.lineTo(unscaledWidth - 2, unscaledHeight / 2 - 1);
			graphics.lineStyle(1, 0x000000, 1.0, true);
			graphics.moveTo(1, unscaledHeight / 2);
			graphics.lineTo(unscaledWidth - 2, unscaledHeight / 2);
		}
	}
}
