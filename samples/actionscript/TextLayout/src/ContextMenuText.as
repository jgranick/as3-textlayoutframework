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
	
	import flashx.textLayout.container.ContainerController;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.edit.EditManager;
	import flashx.undo.UndoManager;

	/** Simple example of a text component where the text is selectable and editable and has custom context menu items.  */
	public class ContextMenuText extends Sprite
	{
		public function ContextMenuText()
		{
			var markup:XML = <TextFlow xmlns='http://ns.adobe.com/textLayout/2008'><p><span>Hello, World</span></p></TextFlow>;
			var textFlow:TextFlow = TextConverter.importToFlow(markup, TextConverter.TEXT_LAYOUT_FORMAT);
			textFlow.flowComposer.addController(new MyContainerController(this, 200, 50)); // Note: using a custom controller for populating/handling context menu
			textFlow.flowComposer.updateAllControllers();
			
			textFlow.interactionManager = new EditManager(new UndoManager());
		}
	}
}

import flash.display.Sprite;
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;
import flash.events.ContextMenuEvent;

import flashx.textLayout.container.ContainerController;
import flashx.textLayout.edit.IEditManager;
import flashx.undo.IUndoManager;

/** Custom container controller for populating context menu and hanlding menu item selection  */
class MyContainerController extends ContainerController
{
	public function MyContainerController(container:Sprite,compositionWidth:Number=100,compositionHeight:Number=100)
	{
		super (container, compositionWidth, compositionHeight);
	}
	
	/** Overridden to add custom items to the context menu */
	override protected function createContextMenu():ContextMenu
	{
		// Get the default context menu used by TLF for editable flows
		var contextMenu:ContextMenu = super.createContextMenu();
		
		// Listen for menu selection
		contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, updateCustomMenuItems);
		
		// Add custom menu items
		_undoItem = new ContextMenuItem("[Undo]"); // for illustration only; not "undo" caption is not allowed 
		_undoItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, undo);
		contextMenu.customItems.push(_undoItem);
		
		_redoItem = new ContextMenuItem("[Redo]");
		_redoItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, redo);
		contextMenu.customItems.push(_redoItem);
		
		return contextMenu;
	}
	
	/** Update the state of the custom menu items before the context menu is displayed */
     private function updateCustomMenuItems(event:ContextMenuEvent):void 
	 {
	 	var undoManager:IUndoManager = (textFlow.interactionManager as IEditManager).undoManager;
	 	_undoItem.enabled = undoManager.canUndo();
	 	_redoItem.enabled = undoManager.canRedo();
     }
     
     private function undo(event:ContextMenuEvent):void 
	 {
		(textFlow.interactionManager as IEditManager).undoManager.undo();
     }
     
     private function redo(event:ContextMenuEvent):void 
	 {
		(textFlow.interactionManager as IEditManager).undoManager.redo();
     }
     
     private var _undoItem:ContextMenuItem;
     private var _redoItem:ContextMenuItem;
}