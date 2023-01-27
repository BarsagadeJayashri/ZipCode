public class ZipCodeWebserviceController {
    
    public string zipCodeNumber{get;set;}
    public string jsonResponse{get;set;}
    public list<ZipcodeClass> infoList{get;set;}
    
    public void searchZipCode(){
        infoList = new list<ZipcodeClass>();
        if(zipCodeNumber != null && zipCodeNumber !=''){
            //invoke the webservice and get the response
            string endPointURL ='https://app.zipcodebase.com/api/v1/search?apikey=2015a560-97cd-11ed-8f7c-f5444718e42b&codes='+zipCodeNumber;
            
            httpRequest pRequest = new httpRequest();
            pRequest.setEndpoint(endPointURl);
            pRequest.setMethod('GET');
            pRequest.setTimeout(12000);
            
            httpResponse pResponse = new httpResponse();
            http pHttp = new http();
            
            pResponse = pHttp.send(pRequest);
            jsonResponse = pResponse.getBody();
            
            //pass the response by using JSONParser and represent on the VF Page.
            system.JSONParser pParser = system.Json.createParser(pResponse.getBody());
            
            while(pParser.nextToken()!= null){
                if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()=='results'){
                    pParser.nextToken();
                    if(pParser.getCurrentToken()==JsonToken.START_OBJECT){
                        pParser.nextToken();
                        if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()==zipCodeNumber){
                            pParser.nextToken();
                        }
                        if(pParser.getCurrentToken()==JsonToken.START_ARRAY){
                            pParser.nextToken();
                            while(pParser.getCurrentToken()== JsonToken.START_OBJECT){
                                ZipcodeClass zipCodeInfo = (ZipcodeClass)pParser.readValueAs(ZipcodeClass.class);
                                infoList.add(zipCodeInfo);
                               
                                pParser.nextToken();
                            }
                        }
                    }
                }
            }
        }
    }
}