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
	import flash.text.engine.*;

	import flashx.textLayout.formats.FormatValue;
	import flashx.textLayout.formats.TextLayoutFormat;
	import flashx.textLayout.tlf_internal;
	use namespace tlf_internal;
	
	public class TextContainerPropertyEditor extends DynamicTextPropertyEditor
	{
		[Embed(source="./assets/cont_align_top_icon.png")]
		private var contAlignTopIcon:Class;

		[Embed(source="./assets/cont_align_middle_icon.png")]
		private var contAlignMiddleIcon:Class;

		[Embed(source="./assets/cont_align_bottom_icon.png")]
		private var contAlignBottomIcon:Class;

		[Embed(source="./assets/cont_align_justify_icon.png")]
		private var contAlignJustifyIcon:Class;

		public function TextContainerPropertyEditor()
		{
			var recipe:XML =
				<recipe>
					<row>
						<editor type="multiIconButton" style="iconButtonGroup" label="$$$/stage/TextEditing/Label/Container/Alignment=Alignment:">
							<property name={TextInspectorController.VERTICAL_ALIGN_UIPROP}/>
							<button icon="contAlignTopIcon" value="top"/>
							<button icon="contAlignMiddleIcon" value="middle"/>
							<button icon="contAlignBottomIcon" value="bottom"/>
							<button icon="contAlignJustifyIcon" value="justify"/>
						</editor>
					</row>
					<row>
						<editor type="hotnumberunit" label="$$$/stage/TextEditing/Label/NumColumns=Columns:">
							<property name={TextInspectorController.COLUMN_COUNT_UIPROP}/>
							<defaultunit>count</defaultunit>
							<numericunit displayname="count"
								min={TextLayoutFormat.columnCountProperty.minValue} 
								max={TextLayoutFormat.columnCountProperty.maxValue} 
								default="1"/>
							<enumval displayname="Auto" value={flashx.textLayout.formats.FormatValue.AUTO}/>
						</editor>
					</row>
					<row>
						<editor type="hotnumberunit" label="$$$/stage/TextEditing/Label/ColumnWidth=Column Width:">
							<property name={TextInspectorController.COLUMN_WIDTH_UIPROP}/>
							<defaultunit>pix</defaultunit>
							<numericunit displayname="pix" 
								min={TextLayoutFormat.columnWidthProperty.minValue} 
								max={TextLayoutFormat.columnWidthProperty.maxValue} 
								default="200"/>
							<enumval displayname="Auto" value={flashx.textLayout.formats.FormatValue.AUTO}/>
						</editor>
						<editor type="hotnumber" label="$$$/stage/TextEditing/Label/ColumnGap=Gap:" decimals="1" enforcePrecision="no">
							<property name={TextInspectorController.COLUMN_GAP_UIPROP} 
								minValue={TextLayoutFormat.columnGapProperty.minValue}
								maxValue={TextLayoutFormat.columnGapProperty.maxValue}/>
						</editor>
					</row>
					<row>
						<editor type="hotnumberunit" label="$$$/stage/TextEditing/Label/PaddingLeft=Padding Left:">
							<property name={TextInspectorController.PADDING_LEFT_UIPROP}/>
							<defaultunit>pix</defaultunit>
							<numericunit displayname="pix" 
								min={TextLayoutFormat.paddingLeftProperty.minValue} 
								max={TextLayoutFormat.paddingLeftProperty.maxValue} 
								default="0"/>
						<enumval displayname="Auto" value={flashx.textLayout.formats.FormatValue.AUTO}/>
						</editor>
					</row>
					<row>
						<editor type="hotnumberunit" label="$$$/stage/TextEditing/Label/PaddingRight=Padding Right:">
							<property name={TextInspectorController.PADDING_RIGHT_UIPROP}/>
							<defaultunit>pix</defaultunit>
							<numericunit displayname="pix" 
								min={TextLayoutFormat.paddingRightProperty.minValue} 
									max={TextLayoutFormat.paddingRightProperty.maxValue} 
									default="0"/>
							<enumval displayname="Auto" value={flashx.textLayout.formats.FormatValue.AUTO}/>
						</editor>
					</row>	
					<row>
						<editor type="hotnumberunit" label="$$$/stage/TextEditing/Label/PaddingTop=Padding Top:">
							<property name={TextInspectorController.PADDING_TOP_UIPROP}/>
							<defaultunit>pix</defaultunit>
							<numericunit displayname="pix" 
								min={TextLayoutFormat.paddingTopProperty.minValue} 
								max={TextLayoutFormat.paddingTopProperty.maxValue} 
								default="0"/>
						<enumval displayname="Auto" value={flashx.textLayout.formats.FormatValue.AUTO}/>
						</editor>
					</row>
					<row>
						<editor type="hotnumberunit" label="$$$/stage/TextEditing/Label/PaddingBottom=Padding Bottom:">
							<property name={TextInspectorController.PADDING_BOTTOM_UIPROP}/>
							<defaultunit>pix</defaultunit>
							<numericunit displayname="pix" 
								min={TextLayoutFormat.paddingBottomProperty.minValue} 
								max={TextLayoutFormat.paddingBottomProperty.maxValue} 
								default="0"/>
						<enumval displayname="Auto" value={flashx.textLayout.formats.FormatValue.AUTO}/>
					</editor>
					</row>			
					<row>
						<editor type="hotnumberunit" label="$$$/stage/TextEditing/Label/FirstBaseline=First Line Offset:">
							<property name={TextInspectorController.FIRST_BASELINE_UIPROP}/>
							<defaultunit>pix</defaultunit>
							<numericunit displayname="pix" 
								min={TextLayoutFormat.firstBaselineOffsetProperty.minValue}
								max={TextLayoutFormat.firstBaselineOffsetProperty.maxValue} 
								default="1"/>
							<enumval displayname="Auto" value={flashx.textLayout.formats.BaselineOffset.AUTO}/>
							<enumval displayname="Ascent" value={flashx.textLayout.formats.BaselineOffset.ASCENT}/>
							<enumval displayname="Line Height" value={flashx.textLayout.formats.BaselineOffset.LINE_HEIGHT}/>
						</editor>
					</row>
			<!--		<row label="$$$/stage/TextEditing/Label/Border=Border:">
						<editor type="combo" label="$$$/stage/TextEditing/Label/BorderStyle=Style:">
							<property name={TextInspectorController.BORDER_STYLE_UIPROP}/>
							<choice display="None" value={text.BorderStyle.NONE}/>
							<choice display="Solid" value={text.BorderStyle.SOLID}/>
							<choice display="Innie" value={text.BorderStyle.INSET}/>
							<choice display="Outie" value={text.BorderStyle.OUTSET}/>
						</editor>
					</row>
					<row>
						<editor type="hotnumber" label="$$$/stage/TextEditing/Label/BorderThickness=Thickness:" decimals="0" enforcePrecision="yes">
							<property name={TextInspectorController.BORDER_THICKNESS_UIPROP} 
								minValue={TextLayoutFormat.borderThicknessProperty.minValue}
								maxValue={TextLayoutFormat.borderThicknessProperty.maxValue}/>
						</editor>
						<editor type="color" label="$$$/stage/TextEditing/Label/BorderColor=Color:">
							<property name={TextInspectorController.BORDER_COLOR_UIPROP}/>
						</editor>
					</row> -->
				</recipe>;

			super(recipe);

 			SetIcon("contAlignTopIcon", contAlignTopIcon);
 			SetIcon("contAlignMiddleIcon", contAlignMiddleIcon);
 			SetIcon("contAlignBottomIcon", contAlignBottomIcon);
 			SetIcon("contAlignJustifyIcon", contAlignJustifyIcon);
		}
		
	}
}
