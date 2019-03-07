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
	import flashx.textLayout.formats.BlockProgression;
	import flashx.textLayout.formats.LineBreak;

	public class TextFlowPropertyEditor extends DynamicTextPropertyEditor
	{
		public function TextFlowPropertyEditor()
		{
			var recipe:XML =
				<recipe>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/LineProgression=Orientation:">
							<property name={TextInspectorController.BLOCK_PROGRESSION_UIPROP}/>
							<choice display="Horizontal" value={flashx.textLayout.formats.BlockProgression.TB}/>
							<choice display="Vertical" value={flashx.textLayout.formats.BlockProgression.RL}/>
						</editor>
					</row>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/direction=Direction:">
							<property name={TextInspectorController.FLOW_DIRECTION_UIPROP}/>
							<choice display="Left to Right" value={flashx.textLayout.formats.Direction.LTR}/>
							<choice display="Right to Left" value={flashx.textLayout.formats.Direction.RTL}/>
						</editor>
					</row>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/Linebreak=Line Breaks:">
							<property name={TextInspectorController.LINE_BREAK_UIPROP}/>
							<choice display="Auto Line Wrap" value={flashx.textLayout.formats.LineBreak.TO_FIT}/>
							<choice display="Hard Breaks Only" value={flashx.textLayout.formats.LineBreak.EXPLICIT}/>
						</editor>
					</row>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/vertScroll=V. Scroll:">
							<property name={TextInspectorController.VERTICAL_SCROLL_UIPROP}/>
							<choice display="Off" value="off"/>
							<choice display="On" value="on"/>
							<choice display="Auto" value="auto"/>
						</editor>
						<editor type="combo" label="$$$/stage/TextEditing/Label/horzScroll=H. Scroll:">
							<property name={TextInspectorController.HORIZONTAL_SCROLL_UIPROP}/>
							<choice display="Off" value="off"/>
							<choice display="On" value="on"/>
							<choice display="Auto" value="auto"/>
						</editor>
					</row>
					<row>
						<editor type="combo" label="$$$/stage/TextEditing/Label/vertScroll=Measure W:">
							<property name={TextInspectorController.MEASURE_WIDTH}/>
							<choice display="Off" value="off"/>
							<choice display="On" value="on"/>
						</editor>
						<editor type="combo" label="$$$/stage/TextEditing/Label/horzScroll=Measure H:">
							<property name={TextInspectorController.MEASURE_HEIGHT}/>
							<choice display="Off" value="off"/>
							<choice display="On" value="on"/>
						</editor>
					</row>
				</recipe>;
			super(recipe);
		}
		
	}
}
