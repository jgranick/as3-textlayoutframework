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
	import flash.filters.DropShadowFilter;
	
	import mx.skins.RectangularBorder;

	public class PopupMenuSkin extends RectangularBorder
	{
		public function PopupMenuSkin()
		{
			super();
			filters = [new DropShadowFilter(2, 90, 0x000000, .45, 2, 2)];
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
	 		if (getStyle("cornerRadius") != undefined)
				mCornerRadius = getStyle("cornerRadius");
			if (getStyle("backColor") != undefined)
				mBackColor = getStyle("backColor");
			if (getStyle("backAlpha") != undefined)
				mBackAlpha = getStyle("backAlpha");
			if (getStyle("lineColor") != undefined)
				mLineColor = getStyle("lineColor");
			if (getStyle("lineAlpha") != undefined)
				mLineAlpha = getStyle("lineAlpha");
			if (getStyle("lineWidth") != undefined)
				mLineWidth = getStyle("lineWidth");
	
			graphics.clear();
	 		graphics.lineStyle(mLineWidth, mLineColor, mLineAlpha);
			graphics.beginFill(mBackColor, mBackAlpha);
			graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
			graphics.endFill();
				
		}
	
	 	private var mCornerRadius:Number = 0;
	 	private var mLineWidth:Number = 1;
	 	private var mBackColor:uint = 0x1a1a1a;
	 	private var mBackAlpha:Number = 0.9;
	 	private var mLineColor:uint = 0xffffff;
	 	private var mLineAlpha:Number = 0.15;


	}
	
	
}
