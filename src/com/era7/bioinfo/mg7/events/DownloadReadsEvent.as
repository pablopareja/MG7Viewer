package com.era7.bioinfo.mg7.events
{
	import flash.events.Event;

	public class DownloadReadsEvent extends Event
	{
		private static const SUFIX:String = "downldReadsEvt";
		
		
		public static const DOWNLOAD_READS:String = "downloadReads" + SUFIX;
		
		
		protected var includeDescendants:Boolean = false;
		protected var format:String = "";
		
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
			format = format;
			includeDescendants = includeDescendants;
		}
		
		/*
		*
		*  Clone function
		*/
		public override function clone():Event{						
			return new DownloadReadsEvent(this.type,this.format,this.includeDescendants,this.bubbles,cancelable);
		}
		
		/*
		* 	GET FORMAT
		*/
		public function getFormat():String{
			return format;
		}
		/*
		* 	GET INCLUDE DESCENDANTS
		*/
		public function getIncludeDescendants():Boolean{
			return includeDescendants;
		}
	}
}