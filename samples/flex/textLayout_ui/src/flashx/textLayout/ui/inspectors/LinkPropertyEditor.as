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
	public class LinkPropertyEditor extends DynamicTextPropertyEditor
	{
		public function LinkPropertyEditor()
		{
			var recipe:XML =
				<recipe>
					<row>
						<editor type="string" label="$$$/stage/TextEditing/Label/linkURL=URL:" width="150">
							<property name={TextInspectorController.LINK_URL_UIPROP}/>
						</editor>
					</row>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/linkTarget=Target:">
							<property name={TextInspectorController.LINK_TARGET_UIPROP}/>
							<choice display="_blank" value={"_blank"}/>
							<choice display="_self" value={"_self"}/>
							<choice display="_parent" value={"_parent"}/>
							<choice display="_top" value={"_top"}/>
						</editor>
						<editor type="checkbox" label="$$$/stage/TextEditing/Label/linkExtend=Extend:">
							<property name={TextInspectorController.LINK_EXTEND_UIPROP}/>
						</editor>
					</row>
				</recipe>;
			super(recipe);
		}
		
	}
}
