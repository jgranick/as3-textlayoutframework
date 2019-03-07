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
	
	import flash.text.engine.*;
	
	import flashx.textLayout.formats.TabStopFormat;
	import flashx.textLayout.tlf_internal;
	use namespace tlf_internal;
	
	public class TabPropertyEditor extends DynamicPropertyEditorBase
	{
		public function TabPropertyEditor()
		{
			var recipe:XML = 
				<recipe>
					<row>
						<editor type="checkbox" label="$$$/stage/TextEditing/Label/showRuler=Show Ruler" labelSide="right">
							<property name="rulervisible"/>
						</editor>
						<editor type="hotnumber" label="$$$/stage/TextEditing/Label/tabPosition=Position:" decimals="1" enforcePrecision="no">
							<property name={TabStopFormat.positionProperty.name}
								minValue={TabStopFormat.positionProperty.minValue}
								maxValue={TabStopFormat.positionProperty.maxValue}/>
						</editor>
					</row>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/tabType=Tab Type:">
							<property name={TabStopFormat.alignmentProperty.name}/>
							<choice display="Start" value={flash.text.engine.TabAlignment.START}/>
							<choice display="Center" value={flash.text.engine.TabAlignment.CENTER}/>
							<choice display="End" value={flash.text.engine.TabAlignment.END}/>
							<choice display="Align" value={flash.text.engine.TabAlignment.DECIMAL}/>
						</editor>
						<editor type="string" label="$$$/stage/TextEditing/Label/tabAlign=Align to:" width="50">
							<property name={TabStopFormat.decimalAlignmentTokenProperty.name}/>
						</editor>
					</row>
				</recipe>;

			super(recipe);
		}
		
	}
}
