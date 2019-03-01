public with sharing class Youtubesearch {

    public static final string key = 'AIzaSyBBIyoGIFMmWMetXcSe1ZQrkPlv9F3yDP8';

    public static final string youtubesearchURL = 'https://www.googleapis.com/youtube/v3/search?key='+key+'&part=snippet';

    @AuraEnabled
    public static String search(String searchstr){

        Http h = new Http();
        HttpRequest req = new HttpRequest();
        String url = youtubesearchURL+'&q=' + EncodingUtil.urlEncode(searchstr,'UTF-8');
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        system.debug('RESULTS..>>>'+res.getBody());
        return res.getBody();

    }

}