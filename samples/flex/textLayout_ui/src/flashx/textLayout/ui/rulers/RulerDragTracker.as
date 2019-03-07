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
package flashx.textLayout.ui.rulers
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	import bxf.ui.toolkit.Tracker;

	public class RulerDragTracker extends Tracker
	{
		public function RulerDragTracker(inPeerToTrackTo:UIComponent, inController:RulerBar, inCookie:Object, inDragThreshold:Number = 2)
		{
			super(inPeerToTrackTo, 0, 0);
			mController = inController;
			mDragCookie = inCookie;
			mDragThreshold = inDragThreshold;
		}
		
		/**	Override to get cursor adjust hook and mouse down. 
		 * @param inMouseEvent mouse info.
		 * @param inCursorAdjust true if this is a mouse up track.*/
		override public function BeginTracking(inMouseEvent:MouseEvent, inCursorAdjust:Boolean):void
		{
			super.BeginTracking(inMouseEvent, inCursorAdjust);
		}
		
		/**	Override to get mouse move. 
		 * @param inMouseEvent mouse info.*/
		override public function ContinueTracking(inMouseEvent:MouseEvent):void
		{
			super.ContinueTracking(inMouseEvent);
			if (!mDragThresholdReached)
			{
				if (Point.distance(mAnchorPt, mTrackPt) >= mDragThreshold)
					mDragThresholdReached = true;
			}
			if (mDragThresholdReached)
				mController.TrackDrag(mTrackPt, mDragCookie, false);
			inMouseEvent.stopPropagation();
		}
		
		/**	Override to get mouse up. 
		 * @param inMouseEvent mouse info.*/
		override public function EndTracking(inMouseEvent:MouseEvent):void
		{
			super.EndTracking(inMouseEvent);
			if (mDragThresholdReached)
				mController.TrackDrag(mTrackPt, mDragCookie, true);
			else
				mController.DragCancelled();
			inMouseEvent.stopPropagation();
		}
		
		override protected function TrackPoint(inMouseEvent:MouseEvent, inAlsoSetAnchor:Boolean): void
		{
			mTrackPt.x = inMouseEvent.stageX;
			mTrackPt.y = inMouseEvent.stageY;
			mTrackPt = mController.globalToLocal(mTrackPt);
			if (inAlsoSetAnchor)
				mAnchorPt = mTrackPt.clone();
		}

		private var mController:RulerBar = null;
		private var mDragCookie:Object = null;
		private var mDragThreshold:Number;
		private var mDragThresholdReached:Boolean = false;
	}
}
