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
	import flash.text.AntiAliasType;
	import flash.text.engine.CFFHinting;
	import flash.text.engine.RenderingMode;

	public class AntiAliasPropertyEditor extends DynamicTextPropertyEditor
	{
		public function AntiAliasPropertyEditor()
		{
			var recipe:XML = 
				<recipe>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/Antialias=Antialias:">
							<property name={TextInspectorController.RENDERING_MODE_UIPROP}/>
							<choice display="Normal" value={flash.text.engine.RenderingMode.NORMAL}/>
							<choice display="CFF" value={flash.text.engine.RenderingMode.CFF}/>
						</editor>
					</row>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/GridFit=Grid Fit:">
							<property name={TextInspectorController.CFF_HINTING_UIPROP}/>
							<choice display="None" value={flash.text.engine.CFFHinting.NONE}/>
							<choice display="Horizontal stem" value={flash.text.engine.CFFHinting.HORIZONTAL_STEM}/>
						</editor>
					</row>
				</recipe>;
			super(recipe);
		}
		
	}
}
