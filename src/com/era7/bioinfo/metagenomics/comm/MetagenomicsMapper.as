package com.era7.bioinfo.metagenomics.comm
{
	import com.era7.bioinfo.metagenomics.comm.RequestList;
	import com.era7.bioinfo.metagenomics.comm.UrlManager;
	import com.era7.bioinfo.xml.metagenomics.ReadResult;
	import com.era7.bioinfo.xml.metagenomics.Sample;
	import com.era7.bioinfo.xml.ncbi.NCBITaxonomyNode;
	import com.era7.communication.interfaces.ServerCallable;
	import com.era7.communication.interfaces.ServerUploadable;
	import com.era7.communication.model.BasicMapper;
	import com.era7.communication.xml.Parameters;
	import com.era7.communication.xml.Request;
	
	import flash.net.FileFilter;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;

	public class MetagenomicsMapper extends BasicMapper
	{
				
		/**
		 * 	Constructor
		 */
		public function MetagenomicsMapper()
		{			
			super();			
		}
		
		
		public function getSamples(serverCallable:ServerCallable):void{
			
			var request:Request = new Request();
			request.setMethod(RequestList.GET_SAMPLES_REQUEST);
						
			mainManager.loadRequest(request, serverCallable, UrlManager.GET_SAMPLES_URL);
			
		}
		
		public function getTaxonomyTree(maxDepth:int,
											 parentTaxId:int,
											 serverCallable:ServerCallable):void{
			
			var request:Request = new Request();
			request.setMethod(RequestList.GET_TAXONOMY_TREE_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(<max_depth>{maxDepth}</max_depth>);
			params.addParametersContent(<tax_id>{parentTaxId}</tax_id>);
			request.setParameters(params);
			
			mainManager.loadRequest(request, serverCallable, UrlManager.GET_TAXONOMY_TREE_URL);
			
		}
		
		public function getWholeTaxonomyTreeForSample(sample:Sample,
													  serverCallable:ServerCallable):void{
			
			var request:Request = new Request();
			request.setMethod(RequestList.GET_WHOLE_TAXONOMY_TREE_FOR_SAMPLE_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(sample.getContent());
			request.setParameters(params);
			
			mainManager.loadRequest(request, serverCallable, UrlManager.GET_WHOLE_TAXONOMY_TREE_FOR_SAMPLE);
			
		}
		
		public function getSampleTaxonomyResultsTable(sample:Sample,
													  serverCallable:ServerCallable):void{
			
			var request:Request = new Request();
			request.setMethod(RequestList.GET_SAMPLE_TAXONOMY_RESULTS_TABLE_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(sample.getContent());
			request.setParameters(params);
			
			mainManager.loadRequest(request, serverCallable, UrlManager.GET_SAMPLE_TAXONOMY_RESULTS_TABLE_URL);
			
		}
		
		public function getReadResult(readResult:ReadResult,
									  serverCallable:ServerCallable):void{
			
			var request:Request = new Request();
			request.setMethod(RequestList.GET_READ_RESULT_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(readResult.getContent());
			request.setParameters(params);
			
			mainManager.loadRequest(request, serverCallable, UrlManager.GET_READ_RESULT_URL);
			
		}
		
		public function getSampleReadResultsForTaxon(sample:Sample,
									  taxonNode:NCBITaxonomyNode,
									  serverCallable:ServerCallable):void{
			
			var request:Request = new Request();
			request.setMethod(RequestList.GET_SAMPLE_READ_RESULTS_FOR_TAXON_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(sample.getContent());
			params.addParametersContent(taxonNode.getContent());
			request.setParameters(params);
			
			mainManager.loadRequest(request, serverCallable, UrlManager.GET_SAMPLE_READ_RESULTS_FOR_TAXON_URL);
			
		}
		
		public function downloadSampleReadResultsForTaxon(sample:Sample,
													 taxonNode:NCBITaxonomyNode,
													 serverCallable:ServerCallable):void{
			
			var request:Request = new Request();
			request.setMethod(RequestList.DOWNLOAD_SAMPLE_READ_RESULTS_FOR_TAXON_REQUEST);
			
			var params:Parameters = new Parameters();
			params.addParametersContent(sample.getContent());
			params.addParametersContent(taxonNode.getContent());
			params.addParametersContent(<file_name>ProteinMultifasta</file_name>);
			request.setParameters(params);
			
			var urlRequest:URLRequest = new URLRequest(UrlManager.DOWNLOAD_SAMPLE_READ_RESULTS_FOR_TAXON_URL);
			
			urlRequest.method = URLRequestMethod.POST;
			var vars:URLVariables = new URLVariables();		
			
			vars.request = request.toString();
			urlRequest.data = vars; 
			
			navigateToURL(urlRequest,"_self");
			
		}
	}
}