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
package flashx.textLayout.ui.rulers
{
	import mx.containers.Canvas;

	public class RulerMarker extends Canvas
	{
		public function RulerMarker(inRuler:RulerBar, inWidth:Number, inHeight:Number, inHOffset:Number, inVOffset:Number, inPos:Number)
		{
			super();
			width = inWidth;
			height = inHeight;
			mHOffset = inHOffset;
			mVOffset = inVOffset;
			mPos = inPos;
			mRuler = inRuler;
		}
		
		override public function initialize():void
		{
			super.initialize();
			positionMarker();
		}
		
		protected function positionMarker():void
		{
			if (parent)
			{
				if (alignToRight)
				{
					x = parent.width - originPosition - pos + hOffset;
					y = parent.height - height + vOffset;
				}
				else
				{
					x = originPosition + pos + hOffset;
					y = parent.height - height + vOffset;
				}
			}
		}
		
		protected function get alignToRight():Boolean
		{
			return ruler.rightToLeft;
		}
		
		protected function get originPosition():Number
		{
			return 0;
		}

		public function set pos(inPos:Number):void
		{
			mPos = inPos;
			positionMarker();
		}
		
		public function get pos():Number
		{
			return mPos;
		}
		
		public function set hOffset(inOffset:Number):void
		{
			mHOffset = inOffset;
			positionMarker();
		}
		
		public function get hOffset():Number
		{
			return mHOffset;
		}
		
		public function set vOffset(inOffset:Number):void
		{
			mVOffset = inOffset;
			positionMarker();
		}
		
		public function get vOffset():Number
		{
			return mVOffset;
		}
		
		public function get ruler():RulerBar
		{
			return mRuler;
		}
		
		public function set markerLeft(inNewLeft:Number):void
		{
			if (parent)
			{
				if (alignToRight)
					pos = parent.width - (inNewLeft + hOffset > parent.width ? parent.width : inNewLeft + hOffset)  - originPosition;
				else
					pos = (inNewLeft < 0 ? 0 : inNewLeft) - originPosition - hOffset;
			}
		}

		private var mPos:Number;
		private var mHOffset:Number;
		private var mVOffset:Number;
		private var mRuler:RulerBar = null;
	}
}
