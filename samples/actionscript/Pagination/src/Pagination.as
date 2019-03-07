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
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.elements.Configuration;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.formats.TextAlign;
	import flashx.textLayout.formats.TextLayoutFormat;
	
	/** Demonstrate a long story with dynamic resize.  Its broken up as a TextFlow per chapter.
	 * Display a chapter at a time - shift+page_up and shift+pageDown navigate between chapters.  
	 * Use the paginationwidget class to manage paging through the chapter */
	public class Pagination extends Sprite
	{
		private var _config:Configuration;
		private var _pageView:PaginationWidget;
		private var _curChapter:int = -1;
		private var _chapterArray:Array;
		
		public function Pagination()
		{
			XML.ignoreWhitespace = false;
			
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
				addToStage(null);
			}
			else
				this.addEventListener(Event.ADDED_TO_STAGE,addToStage,false,0,true);
		}
		
		public function addToStage(e:Event):void
		{
			_pageView = new PaginationWidget();
			addChild(_pageView);
			_pageView.setSize(stage.stageWidth-this.x,stage.stageHeight-this.y);
				
			// update the display on resize
			stage.addEventListener(Event.RESIZE, resizeHandler, false, 0, true);
			// keyboard navigation
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler, false, 0, true);
				
			// Configuration passed to any TextFlows the default importer is importing
			_config = TextFlow.defaultConfiguration;
			_config.inactiveSelectionFormat = _config.focusedSelectionFormat;
			_config.unfocusedSelectionFormat  = _config.focusedSelectionFormat;
				
			_chapterArray = new Array(Alice.contents.length);
				
			setChapter(0);
		}
	
		private function setChapter(chapterNumber:int):void
		{
			_curChapter = chapterNumber;
			
			var textFlow:TextFlow = _chapterArray[_curChapter];
			if (textFlow == null)
			{
				textFlow = TextConverter.importToFlow(Alice.contents[chapterNumber], TextConverter.TEXT_LAYOUT_FORMAT, _config);
				_chapterArray[_curChapter] = textFlow;

				var ca:TextLayoutFormat = new TextLayoutFormat(textFlow.format);
				ca.fontFamily = "Georgia, Times";
				ca.fontSize = 16;
				ca.textIndent = 15;
				ca.paragraphSpaceAfter = 10;
				ca.textAlign = TextAlign.JUSTIFY;
				textFlow.format = ca;
			}
			
			_pageView.textFlow = textFlow;
		}
		
		private function prevChapter():void
		{
			if (_curChapter > 0)
				setChapter(_curChapter-1);
		}
		
		private function nextChapter():void
		{
			if (_curChapter >= 0 && _curChapter < Alice.contents.length-1)
				setChapter(_curChapter+1);
		}
		
		private function resizeHandler(e:Event):void
		{
			_pageView.setSize(stage.stageWidth-this.x,stage.stageHeight-this.y);
		}
		
		/** Handle Key events that change the current chapter */
		private function keyDownHandler(e:KeyboardEvent):void
		{
			if (e.charCode == 0 && e.shiftKey)
			{	
				// the keycodes that we currently handle
				switch(e.keyCode)
				{
					case Keyboard.PAGE_UP:
						prevChapter();
						e.preventDefault();
						return;
					case Keyboard.PAGE_DOWN:
						nextChapter();
						e.preventDefault();
						return;
				}
			}
			_pageView.processKeyDownEvent(e);
		}
	}
}