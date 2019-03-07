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
	import mx.skins.RectangularBorder;

	public class ParagraphPropertyMarkerSkin extends RectangularBorder
	{
		public function ParagraphPropertyMarkerSkin()
		{
			super();
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void
		{
		    super.updateDisplayList(w, h);
		    
		    var propKind:String = getStyle("propkind");
		    var rightToLeftPar:Boolean = getStyle("rightToLeftPar");
		    
		    var t:Number = 0;
		    var b:Number = h;
		    
			graphics.clear();

			graphics.beginFill(0x000000);
			if (rightToLeftPar)
			{
				switch(propKind) {
				case "textIndent":
					b = (h - 1) / 2;
					graphics.moveTo(w, 0);
					graphics.lineTo(w, b);
					graphics.lineTo(0, b);
					graphics.lineTo(w, 0);
					break;
				case "paragraphStartIndent":
					graphics.moveTo(0, 0);
					graphics.lineTo(0, h);
					graphics.lineTo(w, h / 2);
					graphics.lineTo(0, 0);
					break;
				case "paragraphEndIndent":
					t = h - (h - 1) / 2;
					graphics.moveTo(w, h);
					graphics.lineTo(0, t);
					graphics.lineTo(w, t);
					graphics.lineTo(w, h);
					break;
				}
			}
			else
			{
				switch(propKind) {
				case "textIndent":
					b = (h - 1) / 2;
					graphics.moveTo(0, 0);
					graphics.lineTo(w, b);
					graphics.lineTo(0, b);
					graphics.lineTo(0, 0);
					break;
				case "paragraphStartIndent":
					t = h - (h - 1) / 2;
					graphics.moveTo(0, h);
					graphics.lineTo(0, t);
					graphics.lineTo(w, t);
					graphics.lineTo(0, h);
					break;
				case "paragraphEndIndent":
					graphics.moveTo(w, 0);
					graphics.lineTo(w, h);
					graphics.lineTo(0, h / 2);
					graphics.lineTo(w, 0);
					break;
				}
			}
			graphics.endFill();
			
			// this makes the whole rect hittable
	  		graphics.lineStyle();
	    	graphics.beginFill(0x0000ff, 0);
	    	graphics.drawRect(0, t, w, b);
	    	graphics.endFill();
		}
	}
}
