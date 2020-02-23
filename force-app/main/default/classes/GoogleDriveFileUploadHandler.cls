public class GoogleDriveFileUploadHandler{
    
    public class CustomException extends Exception{}
    
    public Static void uploadFile(String attachmentName, Blob attachmentBody, String accessToken){
        string header = '';
        string footer = '';
        string headerEncoded = null;
        String bodyEncoded = null;
        String footerEncoded = null;
        
        header = '\n';
        header +='--foo_bar_baz';
        header +='\nContent-Type: application/json; charset=UTF-8';
        header +='\n\n{';
        header +='\n"title":"'+attachmentName+'","parents": [ { "id": "0ByqPeaOw0U3ROWxMcHRRaHl3UVk" } ]';
        header +='\n}';
        
        header +='\n\n--foo_bar_baz';
        header +='\nContent-Type: text/html; application/msword; application/vnd.openxmlformats-officedocument.wordprocessingml.document';
    
        headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\n\n'));
        
        while(headerEncoded.endsWith('=')){
            header+=' ';
           headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\n\n'));
        }
       
        system.debug('aaaa---> '+attachmentBody);
        system.debug('aaaa---> '+attachmentName);
        
        bodyEncoded = EncodingUtil.base64Encode(attachmentBody);
        
        footer = '\n--foo_bar_baz--';
        
        footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
        
        Blob bodyBlob = null;
       
        String last4Bytes = bodyEncoded.substring(bodyEncoded.length()-4,bodyEncoded.length());
  
          //if the last 4 bytes encoded base64 ends with the padding character (= or ==) then re-encode those bytes with the footer
          //to ensure the padding is added only at the end of the body
          if(last4Bytes.endsWith('='))
          {
               Blob decoded4Bytes = EncodingUtil.base64Decode(last4Bytes);
               HttpRequest tmp = new HttpRequest();
               
               tmp.setBodyAsBlob(decoded4Bytes);
               String last4BytesFooter = tmp.getBody()+footer;  
               bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded.substring(0,bodyEncoded.length()-4)+EncodingUtil.base64Encode(Blob.valueOf(last4BytesFooter)));
          }
          else
          {
               bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);
          }
          
          if(bodyBlob.size()>3000000)
          {
           //this a "public class CustomException extends Exception{}"
               throw new CustomException('File size limit is 3 MBytes');
          }
          

    
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.googleapis.com/upload/drive/v2/files?uploadType=multipart');
        req.setMethod('POST');
        req.setBodyAsBlob(bodyBlob);
        req.setHeader('Authorization', 'Bearer ' + accessToken);
        req.setHeader('Content-Type', 'multipart/related; boundary="foo_bar_baz"');
        req.setHeader('Content-Length',String.valueof(req.getBodyAsBlob().size()));
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('RESPONSE BODY---UF---> '+res.getBody());
    }

}