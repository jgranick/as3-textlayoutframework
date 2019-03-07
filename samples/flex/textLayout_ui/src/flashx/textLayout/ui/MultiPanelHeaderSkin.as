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
package flashx.textLayout.ui
{
	import mx.skins.RectangularBorder;
	import mx.utils.GraphicsUtil;
	import flash.display.LineScaleMode;
	import flash.display.CapsStyle;

	public class MultiPanelHeaderSkin extends RectangularBorder
	{
		public function MultiPanelHeaderSkin()
		{
			super();
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
			
			var fillColors:Array = [0x000000, 0x000000];
			var fillAlphas:Array = [1.0, 1.0];
			var borderColor:uint = 0x2A2A2A;
			var borderAlpha:Number = 1.0;
			
 			if (getStyle("fillColors") != undefined)
				fillColors = getStyle("fillColors");
 			if (getStyle("fillAlphas") != undefined)
				fillAlphas = getStyle("fillAlphas");
 			if (getStyle("borderColor") != undefined)
				borderColor = getStyle("borderColor");
 			if (getStyle("borderAlpha") != undefined)
				borderAlpha = getStyle("borderAlpha");

			graphics.clear();
			drawRoundRect(0,0,w, h, null, fillColors, fillAlphas, verticalGradientMatrix(0,0,w,h));
			graphics.lineStyle(1, borderColor, borderAlpha, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			graphics.drawRect(0, 0, w-1, h);
		}
	}
}
