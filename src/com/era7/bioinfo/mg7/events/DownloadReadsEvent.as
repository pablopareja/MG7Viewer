package com.era7.bioinfo.mg7.events
{
	import flash.events.Event;

	public class DownloadReadsEvent extends Event
	{
		private static const SUFIX:String = "downldReadsEvt";
		
		
		public static const DOWNLOAD_READS:String = "downloadReads" + SUFIX;
		
		
		protected var includeDescendantss:Boolean = false;
		protected var formatt:String = "";
		
		/*
		* CONSTRUCTOR
		*/
		public function DownloadReadsEvent(type:String,
										   format:String,
										   includeDescendants:Boolean,
										   bubbles:Boolean=false, 
										   cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			formatt = format;
			includeDescendantss = includeDescendants;
		}
		
		/*
		*
		*  Clone function
		*/
		public override function clone():Event{						
			return new DownloadReadsEvent(this.type,this.formatt,this.includeDescendantss,this.bubbles,cancelable);
		}
		
		/*
		* 	GET FORMAT
		*/
		public function getFormat():String{
			return formatt;
		}
		/*
		* 	GET INCLUDE DESCENDANTS
		*/
		public function getIncludeDescendants():Boolean{
			return includeDescendantss;
		}
	}
}