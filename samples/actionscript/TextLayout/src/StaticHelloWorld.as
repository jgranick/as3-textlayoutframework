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
package {
	import flash.display.Sprite;
	
	import flashx.textLayout.factory.StringTextLineFactory;
	import flashx.textLayout.formats.TextLayoutFormat;
	import flash.text.engine.TextLine;
	import flash.geom.Rectangle;

	/** "Hello, World" text example for a single paragraph of static text */
	public class StaticHelloWorld extends Sprite
	{
		public function StaticHelloWorld()
		{
			var characterFormat:TextLayoutFormat = new TextLayoutFormat();
			characterFormat.fontSize = 48;
			var factory:StringTextLineFactory = new StringTextLineFactory();
			factory.text = "Hello, world";
			factory.compositionBounds = new Rectangle(0,0,300,100);
			factory.spanFormat = characterFormat;
			factory.createTextLines(callback);

			function callback(tl:TextLine):void
			{ 
				addChild(tl); 
			}
		}

		
	}		
}
