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
package bxf.ui.toolkit
{
	import bxf.ui.utils.EffectiveStage;
	import mx.core.UIComponent;
	import mx.managers.ISystemManager;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class Tracker extends UIComponent implements ITrackerInterface
	{
		public function Tracker(inPeerToTrackTo:UIComponent, inStageX:int, inStageY:int)
		{
			super();
			mouseEnabled = false;
			sm = inPeerToTrackTo.systemManager.topLevelSystemManager;
			x = inStageX;
			y = inStageY;
			mPeerToTrackTo = inPeerToTrackTo;
			mPeerToTrackTo.parent.addChild(this);
			EffectiveStage(this).addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove, true);
			sm.addEventListener(MouseEvent.MOUSE_UP, onMouseUp, true);
			EffectiveStage(this).addEventListener(Event.MOUSE_LEAVE, onMouseLeave, false);
		}
		
		public function Remove():void
		{
			EffectiveStage(this).removeEventListener(Event.MOUSE_LEAVE, onMouseLeave, false);
			EffectiveStage(this).removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove, true);
			sm.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp, true);
			mPeerToTrackTo.parent.removeChild(this);
			mPeerToTrackTo = null;
		}
		
		/**	Override to get cursor adjust hook and mouse down. 
		 * @param inMouseEvent mouse info.
		 * @param inCursorAdjust true if this is a mouse up track.*/
		public function BeginTracking(inMouseEvent:MouseEvent, inCursorAdjust:Boolean):void
		{
			mLastMouseEvent = inMouseEvent;
			TrackPoint(inMouseEvent, true);
		}
		
		/**	Override to get mouse move. 
		 * @param inMouseEvent mouse info.*/
		public function ContinueTracking(inMouseEvent:MouseEvent):void
		{
			TrackPoint(inMouseEvent, false);
		}
		
		/**	Override to get mouse up. 
		 * @param inMouseEvent mouse info.*/
		public function EndTracking(inMouseEvent:MouseEvent):void
		{
			TrackPoint(inMouseEvent, false);
		}
		
		protected function TrackPoint(inMouseEvent:MouseEvent, inAlsoSetAnchor:Boolean): void
		{
			mTrackPt.x = inMouseEvent.stageX;
			mTrackPt.y = inMouseEvent.stageY;
			mTrackPt = globalToLocal(mTrackPt);
			if (inAlsoSetAnchor)
				mAnchorPt = mTrackPt.clone();
		}

		private function onMouseMove(evt:MouseEvent):void
		{
			mLastMouseEvent = evt;
			ContinueTracking(evt);
		}

		private function onMouseUp(evt:MouseEvent):void
		{
			EndTracking(evt);
			Remove();
		}

		private function onMouseLeave(evt:Event):void
		{
			EndTracking(mLastMouseEvent);
			Remove();
		}


		private var mPeerToTrackTo:UIComponent = null;
		private var sm:ISystemManager = null;
		private var mLastMouseEvent:MouseEvent = null;
		protected var mTrackPt:Point = new Point;
		protected var mAnchorPt:Point = new Point;
	}
}
