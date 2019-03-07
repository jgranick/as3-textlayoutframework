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
	import flashx.textLayout.formats.TextLayoutFormat;
	import flashx.textLayout.tlf_internal;
	use namespace tlf_internal;
	
	public class ParagraphPropertyMarker extends RulerMarker
	{
		public function ParagraphPropertyMarker(inRuler:RulerBar, inProperty:String)
		{
			super(inRuler, 6, 13, 0, 0, 0);
			setStyle("propkind", inProperty);
			setStyle("rightToLeftPar", false);
			mProperty = inProperty;
		}
		
		public function get property():String
		{
			return mProperty;
		}
		
		override protected function get alignToRight():Boolean
		{
			switch(mProperty)
			{
			case TextLayoutFormat.textIndentProperty.name:
				return mRightToLeftPar ? true : false;
			case TextLayoutFormat.paragraphStartIndentProperty.name:
				return mRightToLeftPar;
			case TextLayoutFormat.paragraphEndIndentProperty.name:
				return !mRightToLeftPar;
			}
			return false;
		}
		
		override protected function get originPosition():Number
		{
			return mRelativeToPosition;
		}

		public function set relativeToPosition(inRelPos:Number):void
		{
			mRelativeToPosition = inRelPos;
			positionMarker();
		}
		
		override public function get hOffset():Number
		{
			switch(mProperty)
			{
			case TextLayoutFormat.textIndentProperty.name:
				return mRightToLeftPar ? -6 : 0;
			case TextLayoutFormat.paragraphStartIndentProperty.name:
				return mRightToLeftPar ? -6 : 0;
			case TextLayoutFormat.paragraphEndIndentProperty.name:
				return mRightToLeftPar ? 0 : -6;
			}
			return 0;
		}
		
		public function set rightToLeftPar(inRightToLeft:Boolean):void
		{
			if (inRightToLeft != mRightToLeftPar)
			{
				mRightToLeftPar = inRightToLeft;
				setStyle("rightToLeftPar", mRightToLeftPar);
				
				if (mProperty == TextLayoutFormat.paragraphStartIndentProperty.name)
					mProperty = TextLayoutFormat.paragraphEndIndentProperty.name;
				else if (mProperty == TextLayoutFormat.paragraphEndIndentProperty.name)
					mProperty = TextLayoutFormat.paragraphStartIndentProperty.name;
			}
		}
		
		private var mProperty:String;
		private var mRelativeToPosition:Number = 0;
		private var mRightToLeftPar:Boolean = false;
	}
}
