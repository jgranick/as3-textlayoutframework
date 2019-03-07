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
	
	import flashx.textLayout.container.ContainerController;
	import flashx.textLayout.conversion.ImportExportConfiguration;
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.edit.EditManager;
	import flashx.textLayout.elements.Configuration;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.formats.TextLayoutFormat;
	import flashx.textLayout.formats.TextDecoration;
	
	/** Demonstrates customizing the Configuration used by the importer */
	public class CustomImportMarkup extends Sprite
	{
		static private const markup:String = "<TextFlow xmlns='http://ns.adobe.com/textLayout/2008' fontSize='14' textIndent='15' paragraphSpaceAfter='15' paddingTop='4' paddingLeft='4'" + 
				"tabStops='alignment:start, position:100; alignment:start, position:200; alignment:start, position:300; alignment:start, position:400; alignment:start, position:500; alignment:start, position:600; alignment:start, position:700'>" + 
				"<p>The following excerpt is from " + 
				"<a href='http://www.4literature.net/Nathaniel_Hawthorne/Ethan_Brand/'>" + 
				"<span>Ethan Brand</span></a> by " + 
				"<a href='mailto:nathaniel_hawthorne@famousauthors.com'><span>Nathaniel Hawthorne</span></a>.</p>" + 
				"<p><span>There are many </span><span fontStyle='italic'>such</span><span> lime-kilns in that tract of country, for the purpose of burning the white marble which composes a large part of the substance of the hills. Some of them, built years ago, and long deserted, with weeds growing in the vacant round of the interior, which is open to the sky, and grass and wild-flowers rooting themselves into the chinks of the stones, look already like relics of antiquity, and may yet be overspread with the lichens of centuries to come. Others, where the lime-burner still feeds his daily and nightlong fire, afford points of interest to the wanderer among the hills, who seats himself on a log of wood or a fragment of marble, to hold a chat with the solitary man. It is a lonesome, and, when the character is inclined to thought, may be an intensely thoughtful occupation; as it proved in the case of Ethan Brand, who had mused to such strange purpose, in days gone by, while the fire in this very kiln was burning.</span></p><p><span>The man who now watched the fire was of a different order, and troubled himself with no thoughts save the very few that were requisite to his business. At frequent intervals, he flung back the clashing weight of the iron door, and, turning his face from the insufferable glare, thrust in huge logs of oak, or stirred the immense brands with a long pole. Within the furnace were seen the curling and riotous flames, and the burning marble, almost molten with the intensity of heat; while without, the reflection of the fire quivered on the dark intricacy of the surrounding forest, and showed in the foreground a bright and ruddy little picture of the hut, the spring beside its door, the athletic and coal-begrimed figure of the lime-burner, and the half-frightened child, shrinking into the protection of his father's shadow. And when again the iron door was closed, then reappeared the tender light of the half-full moon, which vainly strove to trace out the indistinct shapes of the neighboring mountains; and, in the upper sky, there was a flitting congregation of clouds, still faintly tinged with the rosy sunset, though thus far down into the valley the sunshine had vanished long and long ago.</span></p></TextFlow>";

		public function CustomImportMarkup()
		{	
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			
			// Configuration passed to any TextFlows the default importer is importing
			var config:Configuration = TextFlow.defaultConfiguration;
			// take control of the tabkey - normally it will be ignored and used to move between widgets.
			// without this no easy way to insert tabs
			config.manageTabKey = true;
			// make the links initial display 24 point underline red
            var ca:TextLayoutFormat = new TextLayoutFormat();
            ca.fontSize = 24;
            ca.color = '#ff0000';
            ca.textDecoration=TextDecoration.UNDERLINE;
            config.defaultLinkNormalFormat = ca;

			var textFlow:TextFlow = TextConverter.importToFlow(markup, TextConverter.TEXT_LAYOUT_FORMAT);
			textFlow.flowComposer.addController(new ContainerController(this, stage ? stage.stageWidth : 500, stage ? stage.stageHeight : 500));
			textFlow.flowComposer.updateAllControllers();
			
			textFlow.interactionManager = new EditManager();
		}

	}
}