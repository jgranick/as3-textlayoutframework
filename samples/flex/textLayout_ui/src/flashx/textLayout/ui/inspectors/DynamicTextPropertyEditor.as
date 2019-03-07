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
package flashx.textLayout.ui.inspectors
{
	import bxf.ui.inspectors.DynamicPropertyEditorBase;

	import mx.events.PropertyChangeEvent;

	public class DynamicTextPropertyEditor extends DynamicPropertyEditorBase
	{
		public function DynamicTextPropertyEditor(inRecipe:XML)
		{
			super(inRecipe);
			TextInspectorController.Instance().addEventListener(SelectionUpdateEvent.SELECTION_UPDATE, onSelectionUpdate);
			addEventListener(DynamicPropertyEditorBase.MODELCHANGED_EVENT, onFormatValueChanged, false, 0, true);
			addEventListener(DynamicPropertyEditorBase.MODELEDITED_EVENT, onFormatValueChanged, false, 0, true);
		}
		
		public function set active(inActive:Boolean):void
		{
			if (mActive != inActive)
			{
				mActive = inActive;
				if (mActive)
					TextInspectorController.Instance().forceBroadcastFormats();
			}
		}
		
		public function get active():Boolean
		{
			return mActive;
		}
		
		private function onSelectionUpdate(e:SelectionUpdateEvent):void
		{
			if (mActive)
			{
				reset();
				for (var id:String in e.format)
				{
					if (e.format[id].length == 1)
						properties[id] = e.format[id][0];
					else
						properties[id] = e.format[id];
				}
				rebuildUI();
			}
		}

		private function onFormatValueChanged(e:PropertyChangeEvent):void
		{
			TextInspectorController.Instance().SetTextProperty(e.property as String, e.newValue);
		}
		
		private var mActive:Boolean = false;
	}
}
