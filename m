Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FFE66D195
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Jan 2023 23:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3230C10E4FE;
	Mon, 16 Jan 2023 22:12:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Mon, 16 Jan 2023 22:12:50 UTC
Received: from mail.saystar-bucks.info (unknown [45.13.189.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39E7510E4FA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 16 Jan 2023 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim;
 d=saystar-bucks.info; 
 h=Date:From:To:Subject:MIME-Version:Content-Type:List-Unsubscribe:Message-ID;
 i=starbucks_shop_news@saystar-bucks.info; 
 bh=SiPZZlO+sdfIcYbSnkH5rs8hgZs=;
 b=ci0J6OGD8cY1Nok/DcbFa70mz53fEA+ONia5LPQPQUafOfU02wx5uaIMVgWb1Ye3/Mq0D/mIQn69
 UQbgAZ7KPptl1ec3quv8sBUuCwW4w2FflyPMS+9fX2D3FEI5w0/DVaubJYoe9wL1lKnhPBfnNNB/
 4EuZM6ajqUPyfAI4OW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=saystar-bucks.info; 
 b=ajio0RdhL7LyqE0pMzB7BBgT4JthyKqrTXxaMjEm4FdatqbCYZ0GAmveIu9OJWMjxFwMsZ0yGkSb
 YFPYcEZ6rBWwAto/EvoZGVWAjN/TltJvG9zpgbnQm4JBG+LyOxg6RDzL+Q9Ce+ceDRujmK9OayZ8
 WcCpqd7hKIXBmaY4FsM=;
Received: by mail.saystar-bucks.info id hon5u40001gg for
 <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 16 Jan 2023 17:00:58 -0500 (envelope-from
 <starbucks_shop_news-intel+2Dgvt+2Ddev=lists.freedesktop.org@saystar-bucks.info>)
Date: Mon, 16 Jan 2023 17:00:58 -0500
From: "Starbucks Shop News" <starbucks_shop_news@saystar-bucks.info>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: Receive a reward of up to $100 for sharing your thoughts on Starbucks.
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_562_1135841265.1673906439095"
Message-ID: <0.0.0.3E.1D929F6039141A2.6802A4@mail.saystar-bucks.info>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

------=_Part_562_1135841265.1673906439095
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head> 
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" /> 
  <title>Our Vineyard</title> 
  <style type="text/css">body {
                margin: 0;
                padding: 0;
            }
            table {
                border-collapse: collapse;
            }
            @media only screen and (max-width: 660px){
                table.container{
                    width: 480px !important;
                }
                td.logo{
                    background: #fff url(img/logo_medium.gif) no-repeat 10px 10px;
                    height: 45px;
                }
                td.logo img{
                    display: none;
                }
                td.headline{
                    padding: 5px 0 0 30px !important;
                }
                td.headline h1{
                    font-size: 28px !important;
                }
                td.banner{
                    width: 480px;
                    height: 150px;
                    background: url(img/banner_medium.jpg) no-repeat 0 0;
                }
                td.banner img{
                    display: none;
                }
                td.content{
                    padding-bottom: 30px !important;
                    background-image: url(img/banner_medium_ghost.jpg) !important;
                }
                td.content table.button{
                    width: auto;
                }
                td.content table.button td a{
                    font-size: 14px !important;
                }
                td.promos table{
                    width: 200px !important;
                }
                td.promos table td h3{
                    margin-bottom: 8px;
                }
                td.promos table td img{
                    display: none;
                }
                td.promos table.promo_1 td{
                    background: url(img/promo_1_medium.jpg) no-repeat  0 0;
                    padding: 100px 0 0 0;
                }
                td.promos table.promo_2 td{
                    background: url(img/promo_2_medium.jpg) no-repeat  0 0;
                    padding: 100px 0 0 0;
                }
                td.callout table{
                    width: 50% !important;
                    margin-bottom: 40px;
                }
                td.callout table img{
                    display: none;
                }
                td.callout table br{
                    display: none;
                }
                td.callout table a{
                    display: block;
                    margin-top: 10px;
                }
                td.callout table.callout_1 td{
                    padding: 0 30px 0 60px !important;
                    background: url(img/icon_grapes.gif) no-repeat 0 -13px;
                }
                td.callout table.callout_2 td{
                    padding: 0 20px 0 60px !important;
                    background: url(img/icon_bottle.gif) no-repeat 0 -3px;
                }
                td.callout table.callout_3 td{
                    padding: 0 30px 0 60px !important;
                    background: url(img/icon_basket.gif) no-repeat 0 -13px;
                    clear: left;
                }
                td.callout table.callout_4 td{
                    padding: 0 20px 0 60px !important;
                    background: url(img/icon_camera.gif) no-repeat 10px -23px;
                }
                video,
                video img{
                    width: 416px !important;
                    height: 312px !important;
                }
            @media only screen and (max-width: 510px){
                table.container{
                    width: 100% !important;
                }
                table.container td{
                    border: none !important;
                }
                td.logo{
                    background: #fff url(img/logo_small.gif) no-repeat center 10px;
                    height: 32px;
                }
                td.headline h1{
                    font-size: 24px !important;
                    text-align: center;
                }
                td.banner{
                    height: 115px;
                    background: url(img/banner_small.jpg) no-repeat right 0;
                }
                td.content{
                    line-height: 20px !important;
                    padding-bottom: 10px !important;
                    background: #f5f2e5 url(img/banner_small_ghost.jpg) no-repeat right 0 !important;
                }
                td.footer{
                    padding: 20px 30px !important;
                }
                td.promos table.promo_1 {
                    width: 100% !important;
                    border-top: 1px solid #71a412;
                }
                td.promos table.promo_1 td{
                    background: url(img/promo_1_small.jpg) no-repeat  0 40px;
                    padding: 20px 0 40px 110px;
                }
                td.promos table.promo_2 {
                    width: 100% !important;
                }
                td.promos table.promo_2 td{
                    background: url(img/promo_2_small.jpg) no-repeat  0 20px;
                    padding: 0 0 0 110px;
                    clear: left;
                }
                td.callout{
                    padding: 20px 30px 0 30px !important;
                }
                td.callout table{
                    width: 100% !important;
                    margin-bottom: 20px;
                }
                td.callout table td{
                    padding: 0 0 10px 50px !important;
                    background-size: 50px 50px !important;
                    min-height: 60px;
                }
                td.callout table a{
                    display: inline;
                }
                td.callout table.callout_1 td{
                    background-position: 0 -6px;
                }
                td.callout table.callout_2 td{
                    background-position: 4px -2px;
                }
                td.callout table.callout_3 td{
                    background-position: 0 -7px;
                }
                td.callout table.callout_4 td{
                    background-position: 4px -17px;
                }
                td.callout table br.spacer{
                    display: block;
                }
                video,
                video img{
                    width: 300px !important;
                    height: 255px !important;
                }
            }
	</style> 
 </head> 
 <body bgcolor="#EBEBEB">
  <br /> 
  <br /> &nbsp; 
  <div style="font-size: 1px; color: #efe1b0; display: none">
   Place your preview message text here. This will show in most email clients as the preview text in the inbox. Also, make sure it is long enough to take up all of the space avaliable by your chosen email clients.   </div> 
  <table bgcolor="#EBEBEB" border="0" cellpadding="0" cellspacing="0" width="100%"> 
   <tbody> 
    <tr> 
     <td> 
      <table align="center" border="0" cellpadding="0" cellspacing="0" class="container" width="640"> 
       <tbody> 
        <tr> 
         <td bgcolor="#ffffff" class="logo" style="padding: 10px 20px 0 30px; border-top: 1px solid #009058; border-left: 1px solid #007F4E; border-right: 1px solid #dbc064;" valign="top">&nbsp;</td> 
        </tr> 
        <tr> 
         <td bgcolor="#ffffff" class="headline" style="padding: 15px 20px 5px 30px; border-left: 1px solid #007F4E; border-right: 1px solid #00985D; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 30px;" valign="top"> <h1 style="margin: 0 0 15px 0; font-weight: normal; font-size: 24px; color: #000000; text-align: center">Don't miss out! Just a few clicks away from a chance to win a $100 <strong>STARBUCKS</strong> Card by completing our quick 20-second survey about your recent experience with us.</h1> </td> 
        </tr> 
        <tr> 
         <td bgcolor="#f5f2e5" class="banner" style="border-left: 1px solid #007F4E; border-right: 1px solid #007F4E;" valign="top">&nbsp;</td> 
        </tr> 
        <tr> 
         <td bgcolor="#f5f2e5" class="content" style="padding: 30px 30px 10px 30px; border-right: 1px solid #007F4E; border-left: 1px solid #007F4E; font-family:Arial, Helvetica, sans-serif; font-size: 16px; line-height:22px; color: #654308; background: #A3CFBE url(img/banner_large_ghost.jpg) no-repeat 0 0" valign="top"> 
          <table align="right" border="0" class="button" style="margin: 0 0 10px 30px" width="160"> 
           <tbody> 
            <tr> 
             <td>&nbsp;</td> 
            </tr> 
           </tbody> 
          </table> <a href="http://www.saystar-bucks.info/4676n2H39r5F8QM612E46d7mR10e8X36abrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7uQAdRKn7azTO1V06GJ1NwD/rusting-vacationed"><img alt="" src="http://www.saystar-bucks.info/9e94R2395m7alA13Kv46cPfu10e8y36MbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7AQAdRKn6nm10FI5h@wJD/reprints-Elysium" width="100%" /></a></td> 
        </tr> 
        <tr> 
         <td bgcolor="#f5f2e5" class="promos" style="padding: 10px 30px 25px 30px; border-right:1px solid #007F4E; border-left:1px solid #007F4E; background-color: #f5f2e5; font-family: Arial, Helvetica, sans-serif;" valign="top"> 
          <table align="left" border="0" class="promo_1" width="100%"> 
           <tbody> 
            <tr> 
             <td>&nbsp; 
              <div style="background: #38926F; padding: 20px;font-size: 18px; font-weight: bold;color: white">
               <a href="http://www.saystar-bucks.info/9534h2395SVm8612XX46d8S10e8_36rbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7cQAdRKn5Q10vW6SJ1wDB/Rogers-milled" style="text-align: center;text-decoration: none; padding: 0% 25%; display: block; color: #FFFFFF">Go And Start Now</a>
              </div> <br /> &nbsp;</td> 
            </tr> 
           </tbody> 
          </table> 
          <table align="right" border="0" class="promo_2" width="100%"> 
           <tbody> 
            <tr> 
             <td>&nbsp;</td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
        <tr> 
         <td bgcolor="#BA9B7E" class="callout" style="background-color: #BFB9B4; padding: 30px; border-right: 1px solid #007F4E; border-bottom: 1px solid ##007F4E; border-left: 1px solid #007F4E;" valign="top"> 
          <table align="left" border="0" cellpadding="0" cellspacing="0" class="callout_1" width="100%"> 
           <tbody> 
            <tr> 
             <td style="padding-left: 10px; padding-right: 10px; font-family:Arial, Helvetica, sans-serif; font-size:13px; line-height: 16px; color: #ffffff;" valign="top" width="100%">&nbsp;</td> 
            </tr> 
           </tbody> 
          </table> 
          <table align="left" border="0" cellpadding="0" cellspacing="0" class="callout_2" width="100%"> 
           <tbody> 
            <tr> 
             <td style="padding-left: 10px; padding-right: 10px; font-family:Arial, Helvetica, sans-serif; font-size:13px; line-height: 16px; color: #ffffff;" valign="top" width="100%">&nbsp;</td> 
            </tr> 
           </tbody> 
          </table> 
          <table align="left" border="0" cellpadding="0" cellspacing="0" class="callout_3" width="100%"> 
           <tbody> 
            <tr> 
             <td style="padding-left: 10px; padding-right: 10px; font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 16px; color: #ffffff;" valign="top" width="100%">&nbsp;</td> 
            </tr> 
           </tbody> 
          </table> 
          <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%"> 
           <tbody> 
            <tr> 
             <td style="padding-left: 10px; padding-right: 10px; font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 16px; color: #ffffff; text-align: center;color: #000000" valign="top" width="100%"> <p class="unsubscribe"><span style="text-decoration: none; ">To cancel notifications,</span><a href="http://www.saystar-bucks.info/cf55A23U95R8Bp613A46cYehF10e8q36cbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7CQAdRKn5W1wl06f32@wD/jetting-subclasses" style="text-decoration-line: none; color:"> <span>Go Here Now </span> </a><br /> 126 E 23rd St New York, NY, US 10010<br /> <br /> <br /> <br /> <br /> <br /> <style dir="plower"><small></style><style class="husky"></small></style><style><style></style><span title="plastics"></span></style><big></big><font></font><span size="mildest"></span></p> </td> 
            </tr> 
           </tbody> 
          </table> </td> 
        </tr> 
        <tr> 
         <td class="footer" style="padding: 10px 0px 30px 0px; font-family: Arial, Helvetica, sans-serif; font-size: 11px; color: #b2a16e;" valign="top">&nbsp;</td> 
        </tr> 
       </tbody> 
      </table> </td> 
    </tr> 
   </tbody> 
  </table>   
 <img src="http://www.saystar-bucks.info/swindle-gavel/5d05o239L5m85o_11p46d0n10e8L36rbrxIh-Z5x-HI5fhbwxwEYvIIHIwgxstEsvZ7bQAdRKn7u10FIxh5WW3wD" alt=""/></body>
</html>

------=_Part_562_1135841265.1673906439095--

