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
package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import flash.text.engine.ElementFormat;
	import flash.text.engine.TextBlock;
	import flash.text.engine.TextElement;
	import flash.text.engine.TextLine;
	
	/** Display Hello World using FTE APIs */
	public class FTEHelloWorld extends Sprite
	{
		public function FTEHelloWorld()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var elementFormat:ElementFormat = new ElementFormat();
			elementFormat.fontSize = 48;
			var textElement:TextElement = new TextElement("Hello, world", elementFormat)
			var textBlock:TextBlock = new TextBlock(textElement);
			var textLine:TextLine = textBlock.createTextLine();
			textLine.y = textLine.ascent;
			addChild(textLine);
		}
	}
}
